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
import com.ruoyi.app.domain.AppCollection;
import com.ruoyi.app.service.IAppCollectionService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 收藏Controller
 * 
 * @author ruoyi
 * @date 2023-02-27
 */
@RestController
@RequestMapping("/app/collection")
public class AppCollectionController extends BaseController
{
    @Autowired
    private IAppCollectionService appCollectionService;

    /**
     * 查询收藏列表
     */
    @PreAuthorize("@ss.hasPermi('app:collection:list')")
    @GetMapping("/list")
    public TableDataInfo list(AppCollection appCollection)
    {
        startPage();
        List<AppCollection> list = appCollectionService.selectAppCollectionList(appCollection);
        return getDataTable(list);
    }

    /**
     * 导出收藏列表
     */
    @PreAuthorize("@ss.hasPermi('app:collection:export')")
    @Log(title = "收藏", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, AppCollection appCollection)
    {
        List<AppCollection> list = appCollectionService.selectAppCollectionList(appCollection);
        ExcelUtil<AppCollection> util = new ExcelUtil<AppCollection>(AppCollection.class);
        util.exportExcel(response, list, "收藏数据");
    }

    /**
     * 获取收藏详细信息
     */
    @PreAuthorize("@ss.hasPermi('app:collection:query')")
    @GetMapping(value = "/{uid}")
    public AjaxResult getInfo(@PathVariable("uid") Long uid)
    {
        return success(appCollectionService.selectAppCollectionByUid(uid));
    }

    /**
     * 新增收藏
     */
    @PreAuthorize("@ss.hasPermi('app:collection:add')")
    @Log(title = "收藏", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody AppCollection appCollection)
    {
        return toAjax(appCollectionService.insertAppCollection(appCollection));
    }

    /**
     * 修改收藏
     */
    @PreAuthorize("@ss.hasPermi('app:collection:edit')")
    @Log(title = "收藏", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody AppCollection appCollection)
    {
        return toAjax(appCollectionService.updateAppCollection(appCollection));
    }

    /**
     * 删除收藏
     */
    @PreAuthorize("@ss.hasPermi('app:collection:remove')")
    @Log(title = "收藏", businessType = BusinessType.DELETE)
	@DeleteMapping("/{uids}")
    public AjaxResult remove(@PathVariable Long[] uids)
    {
        return toAjax(appCollectionService.deleteAppCollectionByUids(uids));
    }
}
