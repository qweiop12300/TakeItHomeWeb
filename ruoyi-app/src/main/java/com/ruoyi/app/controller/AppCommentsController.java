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
import com.ruoyi.app.domain.AppComments;
import com.ruoyi.app.service.IAppCommentsService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 评论Controller
 * 
 * @author ruoyi
 * @date 2023-02-27
 */
@RestController
@RequestMapping("/app/comments")
public class AppCommentsController extends BaseController
{
    @Autowired
    private IAppCommentsService appCommentsService;

    /**
     * 查询评论列表
     */
    @PreAuthorize("@ss.hasPermi('app:comments:list')")
    @GetMapping("/list")
    public TableDataInfo list(AppComments appComments)
    {
        startPage();
        List<AppComments> list = appCommentsService.selectAppCommentsList(appComments);
        return getDataTable(list);
    }

    /**
     * 导出评论列表
     */
    @PreAuthorize("@ss.hasPermi('app:comments:export')")
    @Log(title = "评论", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, AppComments appComments)
    {
        List<AppComments> list = appCommentsService.selectAppCommentsList(appComments);
        ExcelUtil<AppComments> util = new ExcelUtil<AppComments>(AppComments.class);
        util.exportExcel(response, list, "评论数据");
    }

    /**
     * 获取评论详细信息
     */
    @PreAuthorize("@ss.hasPermi('app:comments:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(appCommentsService.selectAppCommentsById(id));
    }

    /**
     * 新增评论
     */
    @PreAuthorize("@ss.hasPermi('app:comments:add')")
    @Log(title = "评论", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody AppComments appComments)
    {
        return toAjax(appCommentsService.insertAppComments(appComments));
    }

    /**
     * 修改评论
     */
    @PreAuthorize("@ss.hasPermi('app:comments:edit')")
    @Log(title = "评论", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody AppComments appComments)
    {
        return toAjax(appCommentsService.updateAppComments(appComments));
    }

    /**
     * 删除评论
     */
    @PreAuthorize("@ss.hasPermi('app:comments:remove')")
    @Log(title = "评论", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(appCommentsService.deleteAppCommentsByIds(ids));
    }
}
