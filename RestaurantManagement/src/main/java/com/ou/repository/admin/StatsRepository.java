package com.ou.repository.admin;

import java.time.LocalDate;
import java.util.List;

public interface StatsRepository {
    List<Object[]> billStats(LocalDate fromDate, LocalDate toDate);
    List<Object[]> billMonthStats(int fromYear, int toYear);
    List<Object[]> billQuarterStats(int fromYear, int toYear);
    List<Object[]> billYearStats(int fromYear, int toYear);
    List<Object[]> getListYears();
    List<Object[]> orderMonthStats(int fromYear, int toYear);
    List<Object[]> orderQuarterStats(int fromYear, int toYear);
    List<Object[]> orderYearStats(int fromYear, int toYear);
}
