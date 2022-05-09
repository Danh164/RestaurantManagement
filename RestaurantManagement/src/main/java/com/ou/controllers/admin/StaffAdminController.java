/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ou.controllers.admin;

import com.ou.pojos.User;
import com.ou.services.admin.StaffManagementService;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.transaction.Transactional;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author Danh Nguyen
 */
@Controller
@Transactional
public class StaffAdminController {

    @Autowired
    private StaffManagementService staffManagementService;
    
    @Autowired
    private BCryptPasswordEncoder passwordEncoder;
    
    @GetMapping("/admin/staff")
    public String staff(Model model, @RequestParam(value = "kw", required = false, defaultValue = "") String kw) {
        model.addAttribute("users", this.staffManagementService.getUsers(kw));
        return "staff";
    }

    @GetMapping("/admin/staff/add")
    public String addStaff(Model model) {
        model.addAttribute("staff", new User());
        return "add-staff";
    }

    @PostMapping("/admin/staff/add")
    public String addStaffPost(Model model, @ModelAttribute(value = "staff") @Valid User staff,
            BindingResult result) throws ParseException {
        if (!result.hasErrors()) {
            if(staffManagementService.isExistIdCard(staff)){
                model.addAttribute("errMsg", "Số CMND/CCCD đã được sử dụng");
                return "add-staff";
            }
            staff.setUserIsActive(true);
            staff.setUserRole("STAFF");
            staff.setUserUsename(staff.getUserIdCard());
            staff.setUserPassword(this.passwordEncoder.encode("123456"));
            staff.setUserJoinedDate(new Date());
            staff.setUserDateOfBirth(new SimpleDateFormat("yyyy-MM-dd").parse(staff.getDob()));
            staff.setUserEmail(staff.getUserIdCard()+staff.getUserFirstName()+"@gmail.com");
            if (this.staffManagementService.addOrUpdate(staff)) {
                return "redirect:/admin/staff";
            }
        }
        return "add-staff";
    }

    @GetMapping("/admin/staff/edit")
    public String editStaff(Model model, @RequestParam(value = "id") String id) {
        User staff = staffManagementService.getUserById(id);
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        staff.setDob(dateFormat.format(staff.getUserDateOfBirth()));
        staff.setJd(dateFormat.format(staff.getUserJoinedDate()));
        model.addAttribute("staff", staff);
        return "edit-staff";
    }

    @PostMapping("/admin/staff/edit")
    public String editStaffPost(Model model, @ModelAttribute(value = "staff") @Valid User staff,
            BindingResult result) throws ParseException {
        System.out.println(staff.getId().toString());
        if (!result.hasErrors()) {
             if(staffManagementService.isExistIdCard(staff)){
                model.addAttribute("errMsg", "Số CMND/CCCD đã được sử dụng");
                return "edit-staff";
            }
            staff.setUserDateOfBirth(new SimpleDateFormat("yyyy-MM-dd").parse(staff.getDob()));
            staff.setUserJoinedDate(new SimpleDateFormat("yyyy-MM-dd").parse(staff.getJd()));
            if (this.staffManagementService.addOrUpdate(staff)) {
                return "redirect:/admin/staff";
            }
        }
        return "edit-staff";
    }

    @GetMapping("/admin/staff/delete")
    public String deleteService(Model model, @RequestParam(value = "id") String id) {
        User staff = this.staffManagementService.getUserById(id);
        staff.setUserIsActive(false);
        staffManagementService.delete(staff);
        return "redirect:/admin/staff";
    }
}
