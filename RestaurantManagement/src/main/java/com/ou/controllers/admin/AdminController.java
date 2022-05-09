package com.ou.controllers.admin;

import com.ou.pojos.User;
import com.ou.services.admin.StaffManagementService;
import com.ou.services.admin.StatsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.transaction.Transactional;
import java.text.ParseException;
import java.time.LocalDate;
import java.util.Map;

@Controller
@Transactional
public class AdminController {
    @Autowired
    private StatsService statsService;
    @Autowired
    private StaffManagementService staffManagementService;

    @RequestMapping("/admin")
    public String admin(Model model) {
        return "admin";
    }
    
    @GetMapping("/admin/profile")
    public String adminProfile(Model model) {
        User admin = staffManagementService.getUserById("1");
        admin.setDob(admin.getUserDateOfBirth().toString());
        admin.setJd(admin.getUserJoinedDate().toString());
        model.addAttribute("admin", admin);
        return "admin-profile";
    }
    
    @GetMapping("/admin/bill-day-stats")
    public String billDayStats(Model model, @RequestParam(required = false) Map<String, String> params) throws ParseException {
        LocalDate fromDate = null, toDate = null;
        String from = params.getOrDefault("fromDate", null);
        if (from != null && !from.isEmpty()) {
            fromDate = LocalDate.parse(from);
        }
        String to = params.getOrDefault("toDate", null);
        if (to != null && !to.isEmpty()) {
            toDate = LocalDate.parse(to);
        }

        model.addAttribute("billStats", this.statsService.billStats(fromDate, toDate));
        return "bill-day-stats";
    }

    @GetMapping("/admin/bill-month-stats")
    public String billMonthStats(Model model, @RequestParam(required = false) Map<String, String> params) throws ParseException {
        int fromYear = Integer.parseInt(params.getOrDefault("fromYear", "0"));
        int toYear = Integer.parseInt(params.getOrDefault("toYear", "0"));
        model.addAttribute("years", this.statsService.getListYears());
        model.addAttribute("fromYear", fromYear);
        model.addAttribute("toYear", toYear);
        model.addAttribute("billMonthStats", this.statsService.billMonthStats(fromYear, toYear));
        return "bill-month-stats";
    }

    @GetMapping("/admin/bill-quarter-stats")
    public String billQuarterStats(Model model, @RequestParam(required = false) Map<String, String> params) {
        int fromYear = Integer.parseInt(params.getOrDefault("fromYear", "0"));
        int toYear = Integer.parseInt(params.getOrDefault("toYear", "0"));
        model.addAttribute("years", this.statsService.getListYears());
        model.addAttribute("fromYear", fromYear);
        model.addAttribute("toYear", toYear);
        model.addAttribute("billQuarterStats", this.statsService.billQuarterStats(fromYear, toYear));
        return "bill-quarter-stats";
    }

    @GetMapping("/admin/bill-year-stats")
    public String billYearStats(Model model, @RequestParam(required = false) Map<String, String> params) {
        int fromYear = Integer.parseInt(params.getOrDefault("fromYear", "0"));
        int toYear = Integer.parseInt(params.getOrDefault("toYear", "0"));
        model.addAttribute("years", this.statsService.getListYears());
        model.addAttribute("fromYear", fromYear);
        model.addAttribute("toYear", toYear);
        model.addAttribute("billYearStats", this.statsService.billYearStats(fromYear, toYear));
        return "bill-year-stats";
    }

    @GetMapping("/admin/order-month-stats")
    public String orderMonthStats(Model model, @RequestParam(required = false) Map<String, String> params) throws ParseException {
        int fromYear = Integer.parseInt(params.getOrDefault("fromYear", "0"));
        int toYear = Integer.parseInt(params.getOrDefault("toYear", "0"));
        model.addAttribute("years", this.statsService.getListYears());
        model.addAttribute("fromYear", fromYear);
        model.addAttribute("toYear", toYear);
        model.addAttribute("orderMonthStats", this.statsService.orderMonthStats(fromYear, toYear));
        return "order-month-stats";
    }

    @GetMapping("/admin/order-quarter-stats")
    public String orderQuarterStats(Model model, @RequestParam(required = false) Map<String, String> params) {
        int fromYear = Integer.parseInt(params.getOrDefault("fromYear", "0"));
        int toYear = Integer.parseInt(params.getOrDefault("toYear", "0"));
        model.addAttribute("years", this.statsService.getListYears());
        model.addAttribute("fromYear", fromYear);
        model.addAttribute("toYear", toYear);
        model.addAttribute("orderQuarterStats", this.statsService.orderQuarterStats(fromYear, toYear));
        return "order-quarter-stats";
    }

    @GetMapping("/admin/order-year-stats")
    public String orderYearStats(Model model, @RequestParam(required = false) Map<String, String> params) {
        int fromYear = Integer.parseInt(params.getOrDefault("fromYear", "0"));
        int toYear = Integer.parseInt(params.getOrDefault("toYear", "0"));
        model.addAttribute("years", this.statsService.getListYears());
        model.addAttribute("fromYear", fromYear);
        model.addAttribute("toYear", toYear);
        model.addAttribute("orderYearStats", this.statsService.orderYearStats(fromYear, toYear));
        return "order-year-stats";
    }

    
}
