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
import com.ruoyi.app.domain.AppTopic;
import com.ruoyi.app.service.IAppTopicService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 话题Controller
 * 
 * @author ruoyi
 * @date 2023-02-28
 */
@RestController
@RequestMapping("/app/topic")
public class AppTopicController extends BaseController
{
    @Autowired
    private IAppTopicService appTopicService;

    /**
     * 查询话题列表
     */
    @PreAuthorize("@ss.hasPermi('app:topic:list')")
    @GetMapping("/list")
    public TableDataInfo list(AppTopic appTopic)
    {
        startPage();
        List<AppTopic> list = appTopicService.selectAppTopicList(appTopic);
        return getDataTable(list);
    }

    /**
     * 导出话题列表
     */
    @PreAuthorize("@ss.hasPermi('app:topic:export')")
    @Log(title = "话题", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, AppTopic appTopic)
    {
        List<AppTopic> list = appTopicService.selectAppTopicList(appTopic);
        ExcelUtil<AppTopic> util = new ExcelUtil<AppTopic>(AppTopic.class);
        util.exportExcel(response, list, "话题数据");
    }

    /**
     * 获取话题详细信息
     */
    @PreAuthorize("@ss.hasPermi('app:topic:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(appTopicService.selectAppTopicById(id));
    }

    /**
     * 新增话题
     */
    @PreAuthorize("@ss.hasPermi('app:topic:add')")
    @Log(title = "话题", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody AppTopic appTopic)
    {
        return toAjax(appTopicService.insertAppTopic(appTopic));
    }

    /**
     * 修改话题
     */
    @PreAuthorize("@ss.hasPermi('app:topic:edit')")
    @Log(title = "话题", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody AppTopic appTopic)
    {
        return toAjax(appTopicService.updateAppTopic(appTopic));
    }

    /**
     * 删除话题
     */
    @PreAuthorize("@ss.hasPermi('app:topic:remove')")
    @Log(title = "话题", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(appTopicService.deleteAppTopicByIds(ids));
    }
}
