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
import com.ruoyi.app.domain.AppDonation;
import com.ruoyi.app.service.IAppDonationService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 捐赠Controller
 * 
 * @author ruoyi
 * @date 2023-02-28
 */
@RestController
@RequestMapping("/app/donation")
public class AppDonationController extends BaseController
{
    @Autowired
    private IAppDonationService appDonationService;

    /**
     * 查询捐赠列表
     */
    @PreAuthorize("@ss.hasPermi('app:donation:list')")
    @GetMapping("/list")
    public TableDataInfo list(AppDonation appDonation)
    {
        startPage();
        List<AppDonation> list = appDonationService.selectAppDonationList(appDonation);
        return getDataTable(list);
    }

    /**
     * 导出捐赠列表
     */
    @PreAuthorize("@ss.hasPermi('app:donation:export')")
    @Log(title = "捐赠", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, AppDonation appDonation)
    {
        List<AppDonation> list = appDonationService.selectAppDonationList(appDonation);
        ExcelUtil<AppDonation> util = new ExcelUtil<AppDonation>(AppDonation.class);
        util.exportExcel(response, list, "捐赠数据");
    }

    /**
     * 获取捐赠详细信息
     */
    @PreAuthorize("@ss.hasPermi('app:donation:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(appDonationService.selectAppDonationById(id));
    }

    /**
     * 新增捐赠
     */
    @PreAuthorize("@ss.hasPermi('app:donation:add')")
    @Log(title = "捐赠", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody AppDonation appDonation)
    {
        return toAjax(appDonationService.insertAppDonation(appDonation));
    }

    /**
     * 修改捐赠
     */
    @PreAuthorize("@ss.hasPermi('app:donation:edit')")
    @Log(title = "捐赠", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody AppDonation appDonation)
    {
        return toAjax(appDonationService.updateAppDonation(appDonation));
    }

    /**
     * 删除捐赠
     */
    @PreAuthorize("@ss.hasPermi('app:donation:remove')")
    @Log(title = "捐赠", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(appDonationService.deleteAppDonationByIds(ids));
    }
}
