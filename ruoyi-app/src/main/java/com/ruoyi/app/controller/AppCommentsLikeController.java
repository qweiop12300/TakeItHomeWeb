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
import com.ruoyi.app.domain.AppCommentsLike;
import com.ruoyi.app.service.IAppCommentsLikeService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 评论点赞Controller
 * 
 * @author ruoyi
 * @date 2023-02-27
 */
@RestController
@RequestMapping("/app/comments_like")
public class AppCommentsLikeController extends BaseController
{
    @Autowired
    private IAppCommentsLikeService appCommentsLikeService;

    /**
     * 查询评论点赞列表
     */
    @PreAuthorize("@ss.hasPermi('app:comments_like:list')")
    @GetMapping("/list")
    public TableDataInfo list(AppCommentsLike appCommentsLike)
    {
        startPage();
        List<AppCommentsLike> list = appCommentsLikeService.selectAppCommentsLikeList(appCommentsLike);
        return getDataTable(list);
    }

    /**
     * 导出评论点赞列表
     */
    @PreAuthorize("@ss.hasPermi('app:comments_like:export')")
    @Log(title = "评论点赞", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, AppCommentsLike appCommentsLike)
    {
        List<AppCommentsLike> list = appCommentsLikeService.selectAppCommentsLikeList(appCommentsLike);
        ExcelUtil<AppCommentsLike> util = new ExcelUtil<AppCommentsLike>(AppCommentsLike.class);
        util.exportExcel(response, list, "评论点赞数据");
    }

    /**
     * 获取评论点赞详细信息
     */
    @PreAuthorize("@ss.hasPermi('app:comments_like:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(appCommentsLikeService.selectAppCommentsLikeById(id));
    }

    /**
     * 新增评论点赞
     */
    @PreAuthorize("@ss.hasPermi('app:comments_like:add')")
    @Log(title = "评论点赞", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody AppCommentsLike appCommentsLike)
    {
        return toAjax(appCommentsLikeService.insertAppCommentsLike(appCommentsLike));
    }

    /**
     * 修改评论点赞
     */
    @PreAuthorize("@ss.hasPermi('app:comments_like:edit')")
    @Log(title = "评论点赞", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody AppCommentsLike appCommentsLike)
    {
        return toAjax(appCommentsLikeService.updateAppCommentsLike(appCommentsLike));
    }

    /**
     * 删除评论点赞
     */
    @PreAuthorize("@ss.hasPermi('app:comments_like:remove')")
    @Log(title = "评论点赞", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(appCommentsLikeService.deleteAppCommentsLikeByIds(ids));
    }
}
