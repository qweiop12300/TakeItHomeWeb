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
import com.ruoyi.app.domain.AppPost;
import com.ruoyi.app.service.IAppPostService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 动态Controller
 * 
 * @author ruoyi
 * @date 2023-02-28
 */
@RestController
@RequestMapping("/app/post")
public class AppPostController extends BaseController
{
    @Autowired
    private IAppPostService appPostService;

    /**
     * 查询动态列表
     */
    @GetMapping("/list")
    public TableDataInfo list(AppPost appPost)
    {
        startPage();
        List<AppPost> list = appPostService.selectAppPostList(appPost);
        return getDataTable(list);
    }

    /**
     * 导出动态列表
     */
    @PreAuthorize("@ss.hasPermi('app:post:export')")
    @Log(title = "动态", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, AppPost appPost)
    {
        List<AppPost> list = appPostService.selectAppPostList(appPost);
        ExcelUtil<AppPost> util = new ExcelUtil<AppPost>(AppPost.class);
        util.exportExcel(response, list, "动态数据");
    }

    /**
     * 获取动态详细信息
     */
    @PreAuthorize("@ss.hasPermi('app:post:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(appPostService.selectAppPostById(id));
    }

    /**
     * 新增动态
     */
    @PreAuthorize("@ss.hasPermi('app:post:add')")
    @Log(title = "动态", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody AppPost appPost)
    {
        return toAjax(appPostService.insertAppPost(appPost));
    }

    /**
     * 修改动态
     */
    @PreAuthorize("@ss.hasPermi('app:post:edit')")
    @Log(title = "动态", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody AppPost appPost)
    {
        return toAjax(appPostService.updateAppPost(appPost));
    }

    /**
     * 删除动态
     */
    @PreAuthorize("@ss.hasPermi('app:post:remove')")
    @Log(title = "动态", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(appPostService.deleteAppPostByIds(ids));
    }
}
