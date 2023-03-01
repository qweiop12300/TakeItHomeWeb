package com.ruoyi.app.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.app.domain.UserData;
import com.ruoyi.app.service.IUserDataService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 用户数据扩展Controller
 * 
 * @author ruoyi
 * @date 2023-02-28
 */
@RestController
@RequestMapping("/app/user_data")
public class UserDataController extends BaseController
{
    @Autowired
    private IUserDataService userDataService;

    /**
     * 查询用户数据扩展列表
     */
    @PreAuthorize("@ss.hasPermi('app:user_data:list')")
    @GetMapping("/list")
    public TableDataInfo list(UserData userData)
    {
        startPage();
        List<UserData> list = userDataService.selectUserDataList(userData);
        return getDataTable(list);
    }

    /**
     * 导出用户数据扩展列表
     */
    @PreAuthorize("@ss.hasPermi('app:user_data:export')")
    @Log(title = "用户数据扩展", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, UserData userData)
    {
        List<UserData> list = userDataService.selectUserDataList(userData);
        ExcelUtil<UserData> util = new ExcelUtil<UserData>(UserData.class);
        util.exportExcel(response, list, "用户数据扩展数据");
    }

    /**
     * 获取用户数据扩展详细信息
     */
    @PreAuthorize("@ss.hasPermi('app:user_data:query')")
    @GetMapping(value = "/{uid}")
    public AjaxResult getInfo(@PathVariable("uid") Long uid)
    {
        return success(userDataService.selectUserDataByUid(uid));
    }

    /**
     * 新增用户数据扩展
     */
    @PreAuthorize("@ss.hasPermi('app:user_data:add')")
    @Log(title = "用户数据扩展", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody UserData userData)
    {
        return toAjax(userDataService.insertUserData(userData));
    }

    /**
     * 修改用户数据扩展
     */
    @PreAuthorize("@ss.hasPermi('app:user_data:edit')")
    @Log(title = "用户数据扩展", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody UserData userData)
    {
        return toAjax(userDataService.updateUserData(userData));
    }

    /**
     * 删除用户数据扩展
     */
    @PreAuthorize("@ss.hasPermi('app:user_data:remove')")
    @Log(title = "用户数据扩展", businessType = BusinessType.DELETE)
	@DeleteMapping("/{uids}")
    public AjaxResult remove(@PathVariable Long[] uids)
    {
        return toAjax(userDataService.deleteUserDataByUids(uids));
    }
}
