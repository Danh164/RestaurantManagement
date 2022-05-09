/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ou.controllers.admin;

import com.ou.pojos.Service;
import com.ou.services.admin.ServiceManagementService;
import javax.transaction.Transactional;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
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
public class ServiceAdminController {

    @Autowired
    private ServiceManagementService serviceManagementService;

    @GetMapping("/admin/service")
    public String service(Model model, @RequestParam(value = "kw", required = false, defaultValue = "") String kw) {
        model.addAttribute("services", this.serviceManagementService.getServicesByKw(kw));
        return "service-admin";
    }

    @GetMapping("/admin/service/add")
    public String addServiceInfo(Model model) {
        model.addAttribute("service", new Service());
        return "add-service";
    }

    @PostMapping("/admin/service/add")
    public String addService(Model model, @ModelAttribute(value = "service") @Valid Service service,
            BindingResult result) {
        if (!result.hasErrors()) {
            if(serviceManagementService.isExistServiceName(service)){
                model.addAttribute("errMsg", "Tên Sảnh cưới đã tồn tại!!");
                return "add-service";
            }
            service.setSerIsActive(true);
            if (this.serviceManagementService.addOrUpdateService(service)) {
                return "redirect:/admin/service";
            }
        }
        return "add-service";
    }

    @GetMapping("/admin/service/edit")
    public String editService(Model model, @RequestParam(value = "id") String id) {
        model.addAttribute("service", this.serviceManagementService.getServiceById(id));
        return "edit-service";
    }

    @PostMapping("/admin/service/edit")
    public String addServicePost(Model model, @ModelAttribute(value = "service") @Valid Service service,
            BindingResult result) {
        if (!result.hasErrors()) {
            if(serviceManagementService.isExistServiceName(service)){
                model.addAttribute("errMsg", "Tên Sảnh cưới đã tồn tại!!");
                return "edit-service";
            }
            if (this.serviceManagementService.addOrUpdateService(service)) {
                return "redirect:/admin/service";
            }
        }
        return "edit-service";
    }

    @GetMapping("/admin/service/delete")
    public String deleteService(Model model, @RequestParam(value = "id") String id) {
        Service service = this.serviceManagementService.getServiceById(id);
        service.setSerIsActive(false);
        serviceManagementService.delete(service);
        return "redirect:/admin/service";
    }
}
