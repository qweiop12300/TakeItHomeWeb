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
import com.ruoyi.app.domain.AppHead;
import com.ruoyi.app.service.IAppHeadService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 公告Controller
 * 
 * @author ruoyi
 * @date 2023-03-16
 */
@RestController
@RequestMapping("/app/head")
public class AppHeadController extends BaseController
{
    @Autowired
    private IAppHeadService appHeadService;

    /**
     * 查询公告列表
     */
    @GetMapping("/list")
    public TableDataInfo list(AppHead appHead)
    {
        startPage();
        List<AppHead> list = appHeadService.selectAppHeadList(appHead);
        return getDataTable(list);
    }

    /**
     * 导出公告列表
     */
    @PreAuthorize("@ss.hasPermi('app:head:export')")
    @Log(title = "公告", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, AppHead appHead)
    {
        List<AppHead> list = appHeadService.selectAppHeadList(appHead);
        ExcelUtil<AppHead> util = new ExcelUtil<AppHead>(AppHead.class);
        util.exportExcel(response, list, "公告数据");
    }

    /**
     * 获取公告详细信息
     */
    @PreAuthorize("@ss.hasPermi('app:head:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(appHeadService.selectAppHeadById(id));
    }

    /**
     * 新增公告
     */
    @PreAuthorize("@ss.hasPermi('app:head:add')")
    @Log(title = "公告", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody AppHead appHead)
    {
        return toAjax(appHeadService.insertAppHead(appHead));
    }

    /**
     * 修改公告
     */
    @PreAuthorize("@ss.hasPermi('app:head:edit')")
    @Log(title = "公告", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody AppHead appHead)
    {
        return toAjax(appHeadService.updateAppHead(appHead));
    }

    /**
     * 删除公告
     */
    @PreAuthorize("@ss.hasPermi('app:head:remove')")
    @Log(title = "公告", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(appHeadService.deleteAppHeadByIds(ids));
    }
}
