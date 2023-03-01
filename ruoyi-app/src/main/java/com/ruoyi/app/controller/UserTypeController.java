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
import com.ruoyi.app.domain.UserType;
import com.ruoyi.app.service.IUserTypeService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 用户类型Controller
 * 
 * @author ruoyi
 * @date 2023-02-28
 */
@RestController
@RequestMapping("/app/user_type")
public class UserTypeController extends BaseController
{
    @Autowired
    private IUserTypeService userTypeService;

    /**
     * 查询用户类型列表
     */
    @PreAuthorize("@ss.hasPermi('app:user_type:list')")
    @GetMapping("/list")
    public TableDataInfo list(UserType userType)
    {
        startPage();
        List<UserType> list = userTypeService.selectUserTypeList(userType);
        return getDataTable(list);
    }

    /**
     * 导出用户类型列表
     */
    @PreAuthorize("@ss.hasPermi('app:user_type:export')")
    @Log(title = "用户类型", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, UserType userType)
    {
        List<UserType> list = userTypeService.selectUserTypeList(userType);
        ExcelUtil<UserType> util = new ExcelUtil<UserType>(UserType.class);
        util.exportExcel(response, list, "用户类型数据");
    }

    /**
     * 获取用户类型详细信息
     */
    @PreAuthorize("@ss.hasPermi('app:user_type:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(userTypeService.selectUserTypeById(id));
    }

    /**
     * 新增用户类型
     */
    @PreAuthorize("@ss.hasPermi('app:user_type:add')")
    @Log(title = "用户类型", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody UserType userType)
    {
        return toAjax(userTypeService.insertUserType(userType));
    }

    /**
     * 修改用户类型
     */
    @PreAuthorize("@ss.hasPermi('app:user_type:edit')")
    @Log(title = "用户类型", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody UserType userType)
    {
        return toAjax(userTypeService.updateUserType(userType));
    }

    /**
     * 删除用户类型
     */
    @PreAuthorize("@ss.hasPermi('app:user_type:remove')")
    @Log(title = "用户类型", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(userTypeService.deleteUserTypeByIds(ids));
    }
}
