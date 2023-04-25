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
import com.ruoyi.app.domain.AppLike;
import com.ruoyi.app.service.IAppLikeService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 点赞Controller
 * 
 * @author ruoyi
 * @date 2023-02-28
 */
@RestController
@RequestMapping("/app/like")
public class
AppLikeController extends BaseController
{
    @Autowired
    private IAppLikeService appLikeService;

    /**
     * 查询点赞列表
     */
    @PreAuthorize("@ss.hasPermi('app:like:list')")
    @GetMapping("/list")
    public TableDataInfo list(AppLike appLike)
    {
        startPage();
        List<AppLike> list = appLikeService.selectAppLikeList(appLike);
        return getDataTable(list);
    }

    /**
     * 导出点赞列表
     */
    @PreAuthorize("@ss.hasPermi('app:like:export')")
    @Log(title = "点赞", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, AppLike appLike)
    {
        List<AppLike> list = appLikeService.selectAppLikeList(appLike);
        ExcelUtil<AppLike> util = new ExcelUtil<AppLike>(AppLike.class);
        util.exportExcel(response, list, "点赞数据");
    }

    /**
     * 获取点赞详细信息
     */
    @PreAuthorize("@ss.hasPermi('app:like:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(appLikeService.selectAppLikeById(id));
    }

    /**
     * 新增点赞
     */
    @PreAuthorize("@ss.hasPermi('app:like:add')")
    @Log(title = "点赞", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody AppLike appLike)
    {
        return toAjax(appLikeService.insertAppLike(appLike));
    }

    /**
     * 修改点赞
     */
    @PreAuthorize("@ss.hasPermi('app:like:edit')")
    @Log(title = "点赞", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody AppLike appLike)
    {
        return toAjax(appLikeService.updateAppLike(appLike));
    }

    /**
     * 删除点赞
     */
    @PreAuthorize("@ss.hasPermi('app:like:remove')")
    @Log(title = "点赞", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(appLikeService.deleteAppLikeByIds(ids));
    }
}
