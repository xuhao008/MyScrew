package com.atoz.screw.utils;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * @description:
 * @author: hao.xu
 * @create: 2020-10-12 13:45
 */

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PageBean<T> {
    // 当前页
    private Integer currentPage = 1;
    // 每页显示的总条数
    private Integer pageSize = 10;
    // 总条数
    private Integer totalNum;
    // 总页数
    private Integer totalPage;
    // 分页结果
    private List<T> items;
}
