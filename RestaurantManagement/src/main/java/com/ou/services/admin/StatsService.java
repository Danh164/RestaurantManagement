package com.ou.services.admin;

import java.time.LocalDate;
import java.util.Date;
import java.util.List;

public interface StatsService {
    List<Object[]> billStats(LocalDate fromDate, LocalDate toDate);
    List<Object[]> billMonthStats(int fromYear, int toYear);
    List<Object[]> billQuarterStats(int fromYear, int toYear);
    List<Object[]> getListYears();
    List<Object[]> billYearStats(int fromYear, int toYear);
    List<Object[]> orderMonthStats(int fromYear, int toYear);
    List<Object[]> orderQuarterStats(int fromYear, int toYear);
    List<Object[]> orderYearStats(int fromYear, int toYear);
}
