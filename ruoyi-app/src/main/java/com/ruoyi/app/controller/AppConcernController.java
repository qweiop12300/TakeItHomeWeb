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
import com.ruoyi.app.domain.AppConcern;
import com.ruoyi.app.service.IAppConcernService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 关注Controller
 * 
 * @author ruoyi
 * @date 2023-02-28
 */
@RestController
@RequestMapping("/app/concern")
public class AppConcernController extends BaseController
{
    @Autowired
    private IAppConcernService appConcernService;

    /**
     * 查询关注列表
     */
    @PreAuthorize("@ss.hasPermi('app:concern:list')")
    @GetMapping("/list")
    public TableDataInfo list(AppConcern appConcern)
    {
        startPage();
        List<AppConcern> list = appConcernService.selectAppConcernList(appConcern);
        return getDataTable(list);
    }

    /**
     * 导出关注列表
     */
    @PreAuthorize("@ss.hasPermi('app:concern:export')")
    @Log(title = "关注", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, AppConcern appConcern)
    {
        List<AppConcern> list = appConcernService.selectAppConcernList(appConcern);
        ExcelUtil<AppConcern> util = new ExcelUtil<AppConcern>(AppConcern.class);
        util.exportExcel(response, list, "关注数据");
    }

    /**
     * 获取关注详细信息
     */
    @PreAuthorize("@ss.hasPermi('app:concern:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(appConcernService.selectAppConcernById(id));
    }

    /**
     * 新增关注
     */
    @PreAuthorize("@ss.hasPermi('app:concern:add')")
    @Log(title = "关注", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody AppConcern appConcern)
    {
        return toAjax(appConcernService.insertAppConcern(appConcern));
    }

    /**
     * 修改关注
     */
    @PreAuthorize("@ss.hasPermi('app:concern:edit')")
    @Log(title = "关注", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody AppConcern appConcern)
    {
        return toAjax(appConcernService.updateAppConcern(appConcern));
    }

    /**
     * 删除关注
     */
    @PreAuthorize("@ss.hasPermi('app:concern:remove')")
    @Log(title = "关注", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(appConcernService.deleteAppConcernByIds(ids));
    }
}
