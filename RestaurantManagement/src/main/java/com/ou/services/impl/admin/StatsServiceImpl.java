package com.ou.services.impl.admin;

import com.ou.pojos.Bill;
import com.ou.repository.admin.StatsRepository;
import com.ou.services.admin.StatsService;
import java.time.LocalDate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class StatsServiceImpl implements StatsService {
    @Autowired
    private StatsRepository statsRepository;
    @Override
    public List<Object[]> billStats(LocalDate fromDate, LocalDate toDate) {
        return this.statsRepository.billStats(fromDate, toDate);
    }

    @Override
    public List<Object[]> billMonthStats(int fromYear, int toYear) {
       return this.statsRepository.billMonthStats(fromYear, toYear);
    }

    @Override
    public List<Object[]> billQuarterStats(int fromYear, int toYear) {
      return this.statsRepository.billQuarterStats(fromYear, toYear);
    }

    @Override
    public List<Object[]> getListYears() {
        return this.statsRepository.getListYears();
    }

    @Override
    public List<Object[]> billYearStats(int fromYear, int toYear) {
        return this.statsRepository.billYearStats(fromYear, toYear);
    }

    @Override
    public List<Object[]> orderMonthStats(int fromYear, int toYear) {
        return this.statsRepository.orderMonthStats(fromYear, toYear);
    }

    @Override
    public List<Object[]> orderQuarterStats(int fromYear, int toYear) {
        return this.statsRepository.orderQuarterStats(fromYear, toYear);
    }

    @Override
    public List<Object[]> orderYearStats(int fromYear, int toYear) {
        return this.statsRepository.orderYearStats(fromYear, toYear);
    }
}
