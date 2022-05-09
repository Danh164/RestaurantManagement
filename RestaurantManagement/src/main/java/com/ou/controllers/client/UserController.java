/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ou.controllers.client;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.ou.pojos.User;
import com.ou.services.client.UserService;
import com.ou.utils.Code;
import com.ou.utils.RandomUtil;
import com.ou.utils.SendMailUtil;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.MessagingException;
import javax.transaction.Transactional;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author Admin
 */
@Controller
@Transactional
public class UserController {

    @Autowired
    private UserService userService;
    @Autowired
    private Cloudinary cloudinary;
    private User newUser;
    private int code;
    String vocative;

    @RequestMapping("/sign-up")
    @Transactional
    public String signUp(Model model) {
        model.addAttribute("user", new User());
        return "sign-up";
    }

    @PostMapping("/sign-up")
    public String signUpPost(Model model,
            @ModelAttribute(value = "user") @Valid User user,
            BindingResult result) {
        String messErr = "";

        if (!result.hasErrors()) {
            try {
                if (!user.getFile().isEmpty()) {
                    Map r = this.cloudinary.uploader().upload(user.getFile().getBytes(),
                            ObjectUtils.asMap("resource_type", "auto"));
                    user.setUserImage((String) r.get("secure_url"));
                }else{
                    model.addAttribute("messErr", "Vui lòng chọn ảnh!!");
                    return "sign-up";
                }
            } catch (IOException ex) {
                System.err.println(ex.getMessage());
            }
            if (user.getUserPassword().length() > 5 && user.getConfirmPassword().length() > 5) {
                if (!user.getUserPassword().isEmpty() && !user.getConfirmPassword().isEmpty()) {
                    if (this.userService.isUserByUsername(user.getUserUsename().trim()) == 0) {
                        if (this.userService.isUserByIdCard(user.getUserIdCard()) == 0) {
                            if (user.getConfirmPassword().equals(user.getUserPassword())) {
                                try {
                                    if (user.getUserSex()) {
                                        vocative = "Anh " + user.getUserFirstName();
                                    } else {
                                        vocative = "Chị " + user.getUserFirstName();
                                    }
                                    code = RandomUtil.RandomInt();
                                    SendMailUtil.SendMail(user.getUserEmail(), code, vocative);
                                    this.newUser = user;
                                    return "redirect:/confirm-sign-up";
                                } catch (MessagingException ex) {
                                    Logger.getLogger(UserController.class.getName()).log(Level.SEVERE, null, ex);
                                } catch (UnsupportedEncodingException ex) {
                                    Logger.getLogger(UserController.class.getName()).log(Level.SEVERE, null, ex);
                                }
                            } else {
                                messErr = "Mật khẩu không khớp!";
                            }
                        } else {
                            messErr = "Số CMND/CCCD đã tồn tại! ";
                        }
                    } else {
                        messErr = "Tên tài khoản đã tồn tại!";
                    }
                } else {
                    messErr = "Vui lòng nhập mật khẩu";
                }
            } else {
                messErr = "Mật khẩu phải từ 6 kí tự trở lên";
            }
        }
        model.addAttribute("messErr", messErr);
        return "sign-up";
    }

    @RequestMapping("/confirm-sign-up")
    @Transactional
    public String confirmEmail(Model model) {
        model.addAttribute("code", new Code());
        model.addAttribute("vocative", vocative);
        model.addAttribute("email", newUser.getUserEmail());
        return "confirm-sign-up";
    }

    @PostMapping("/confirm-sign-up")
    public String confirmPost(Model model, @ModelAttribute(value = "code") @Valid Code codeCon) {
        int inputCode = 0;
        try {
            inputCode = Integer.parseInt(codeCon.getCodeNumber().trim());
        } catch (Exception e) {
            model.addAttribute("err", "Mã xác nhận gồm những chữ số !");
            return "confirm-sign-up";
        }
        if (inputCode == code) {
            if (this.userService.addUser(newUser) == true) {
                return "redirect:/sign-in"; // thanh cong
            } else {
                model.addAttribute("err", "Vui lòng kiểm tra lại!");
            }
        } else {
            model.addAttribute("err", "Mã xác nhận sai !");
        }
        return "confirm-sign-up";
    }

    @GetMapping("api/sign-in-again")
    public ResponseEntity<Boolean> sendAgain() {
        try {
            code = RandomUtil.RandomInt();
            SendMailUtil.SendMail(newUser.getUserEmail(), code, vocative);
            return new ResponseEntity<>(true, HttpStatus.OK);
        } catch (MessagingException ex) {
            Logger.getLogger(UserController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (UnsupportedEncodingException ex) {
            Logger.getLogger(UserController.class.getName()).log(Level.SEVERE, null, ex);
        }
        return new ResponseEntity<>(false, HttpStatus.OK);
    }
}
