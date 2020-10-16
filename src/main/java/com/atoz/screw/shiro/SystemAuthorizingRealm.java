package com.atoz.screw.shiro;

import com.atoz.screw.entity.SysResources;
import com.atoz.screw.entity.SysRole;
import com.atoz.screw.entity.SysUser;
import com.atoz.screw.service.SysResourcesService;
import com.atoz.screw.service.SysRoleService;
import com.atoz.screw.service.SysUserService;
import com.atoz.screw.utils.StringUtils;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * @description: 登录及权限验证
 * @author: hao.xu
 * @create: 2020-10-12 15:21
 */

public class SystemAuthorizingRealm extends AuthorizingRealm{

    @Autowired
    private SysUserService sysUserService;

    @Autowired
    private SysRoleService sysRoleService;

    @Autowired
    private SysResourcesService sysResourcesService;

    /**
     * @Description 角色权限和对应权限添加 Authorization授权，将数据库中的角色和权限授权给输入的用户名
     * @Param [principalCollection]
     * @return org.apache.shiro.authz.AuthorizationInfo
     * @Date 2020/10/12 15:22
     **/
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        System.out.println("执行授权逻辑");
        SysUser sysUser = (SysUser) principalCollection.getPrimaryPrincipal();
        // String username = (String) SecurityUtils.getSubject().getPrincipal();
        if (StringUtils.isEmpty(sysUser.getUsername())){
            return null;
        }
        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
        // 赋予角色
        List<SysRole> roleList = sysRoleService.selRoleList((long) sysUser.getId());
        if (CollectionUtils.isEmpty(roleList)){
            return null;
        }
        for (SysRole role : roleList) {
            info.addRole(role.getName());
        }
        // 赋予权限
        List<SysResources> resourcesList = null;
        if ("root".equalsIgnoreCase(sysUser.getUserType())){
            resourcesList=sysResourcesService.list();
        }else {
            resourcesList= sysResourcesService.selResourceList(sysUser.getId());
        }
        if (!CollectionUtils.isEmpty(resourcesList)) {
            Set<String> permissionSet = new HashSet<>();
            for (SysResources resources : resourcesList) {
                String permission = null;
                if (!StringUtils.isEmpty(permission = resources.getPermission())) {
                    permissionSet.addAll(Arrays.asList(permission.trim().split(",")));
                }
            }
            info.setStringPermissions(permissionSet);
        }
        return info;
    }
    
    /**
     * @Description 用户身份验证
     * @Param [authenticationToken]
     * @return org.apache.shiro.authc.AuthenticationInfo
     * @Date 2020/10/12 15:22
     **/
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
        System.out.println("执行认证逻辑");
        System.out.println("-------身份认证方法--------");
        UsernamePasswordToken token = (UsernamePasswordToken) authenticationToken;
        String username = token.getUsername();
        //根据用户名从数据库获取密码
        QueryWrapper<SysUser> queryWrapper=new QueryWrapper<>();
        queryWrapper.ge("username",username);
        SysUser sysUser = sysUserService.getOne(queryWrapper);
        if (StringUtils.isNull(sysUser)){
            return null;
        }
        return new SimpleAuthenticationInfo(sysUser, sysUser.getPassword(),getName());
    }
}
