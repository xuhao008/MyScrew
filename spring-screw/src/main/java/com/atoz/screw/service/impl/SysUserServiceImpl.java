package com.atoz.screw.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import com.atoz.screw.entity.SysUser;
import com.atoz.screw.mapper.SysUserMapper;
import com.atoz.screw.service.SysUserService;

/**
 * @description:
 * @author: hao.xu
 * @create: 2020-10-12 16:34
 */
@Service
public class SysUserServiceImpl extends ServiceImpl<SysUserMapper, SysUser> implements SysUserService {
}
