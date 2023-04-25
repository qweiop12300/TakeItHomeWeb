package com.ruoyi.web.controller.system;

import com.ruoyi.common.utils.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.domain.entity.UserData;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.app.service.IUserDataService;

/**
 * 用户数据扩展Controller
 * 
 * @author ruoyi
 * @date 2023-03-26
 */
@RestController
@RequestMapping("/system/user_data")
public class UserDataController extends BaseController
{
    @Autowired
    private IUserDataService userDataService;


    @GetMapping(value = "/{uid}")
    public AjaxResult getInfo()
    {
        return success(userDataService.selectUserDataByUid(SecurityUtils.getUserId()));
    }


    /**
     * 修改用户数据扩展
     */
    @Log(title = "用户数据扩展", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody UserData userData)
    {
        userData.setUid(SecurityUtils.getUserId());
        return toAjax(userDataService.updateUserData(userData));
    }

//    /**
//     * 删除用户数据扩展
//     */
//    @PreAuthorize("@ss.hasPermi('system:user_data:remove')")
//    @Log(title = "用户数据扩展", businessType = BusinessType.DELETE)
//	@DeleteMapping("/{uids}")
//    public AjaxResult remove(@PathVariable Long[] uids)
//    {
//        return toAjax(userDataService.deleteUserDataByUids(uids));
//    }
}
