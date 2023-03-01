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
import com.ruoyi.app.domain.AppPostType;
import com.ruoyi.app.service.IAppPostTypeService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 动态类型Controller
 * 
 * @author ruoyi
 * @date 2023-02-28
 */
@RestController
@RequestMapping("/app/post_type")
public class AppPostTypeController extends BaseController
{
    @Autowired
    private IAppPostTypeService appPostTypeService;

    /**
     * 查询动态类型列表
     */
    @PreAuthorize("@ss.hasPermi('app:post_type:list')")
    @GetMapping("/list")
    public TableDataInfo list(AppPostType appPostType)
    {
        startPage();
        List<AppPostType> list = appPostTypeService.selectAppPostTypeList(appPostType);
        return getDataTable(list);
    }

    /**
     * 导出动态类型列表
     */
    @PreAuthorize("@ss.hasPermi('app:post_type:export')")
    @Log(title = "动态类型", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, AppPostType appPostType)
    {
        List<AppPostType> list = appPostTypeService.selectAppPostTypeList(appPostType);
        ExcelUtil<AppPostType> util = new ExcelUtil<AppPostType>(AppPostType.class);
        util.exportExcel(response, list, "动态类型数据");
    }

    /**
     * 获取动态类型详细信息
     */
    @PreAuthorize("@ss.hasPermi('app:post_type:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(appPostTypeService.selectAppPostTypeById(id));
    }

    /**
     * 新增动态类型
     */
    @PreAuthorize("@ss.hasPermi('app:post_type:add')")
    @Log(title = "动态类型", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody AppPostType appPostType)
    {
        return toAjax(appPostTypeService.insertAppPostType(appPostType));
    }

    /**
     * 修改动态类型
     */
    @PreAuthorize("@ss.hasPermi('app:post_type:edit')")
    @Log(title = "动态类型", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody AppPostType appPostType)
    {
        return toAjax(appPostTypeService.updateAppPostType(appPostType));
    }

    /**
     * 删除动态类型
     */
    @PreAuthorize("@ss.hasPermi('app:post_type:remove')")
    @Log(title = "动态类型", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(appPostTypeService.deleteAppPostTypeByIds(ids));
    }
}
