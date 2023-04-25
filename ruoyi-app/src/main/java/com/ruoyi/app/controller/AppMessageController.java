package com.ruoyi.app.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.ruoyi.app.domain.SysUserE;
import com.ruoyi.common.utils.SecurityUtils;
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
import com.ruoyi.app.domain.AppMessage;
import com.ruoyi.app.service.IAppMessageService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 消息Controller
 * 
 * @author ruoyi
 * @date 2023-02-28
 */
@RestController
@RequestMapping("/app/message")
public class AppMessageController extends BaseController
{
    @Autowired
    private IAppMessageService appMessageService;

    /**
     * 查询消息列表
     */
    @PreAuthorize("@ss.hasPermi('app:message:list')")
    @GetMapping("/list")
    public TableDataInfo list(AppMessage appMessage)
    {
        startPage();
        List<AppMessage> list = appMessageService.selectAppMessageList(appMessage);
        return getDataTable(list);
    }

    @PreAuthorize("@ss.hasPermi('app:message:list')")
    @GetMapping("/userList")
    public TableDataInfo listUser()
    {
        startPage();
        List<SysUserE> list = appMessageService.selectUserList(SecurityUtils.getUserId());
        return getDataTable(list);
    }

    /**
     * 导出消息列表
     */
    @PreAuthorize("@ss.hasPermi('app:message:export')")
    @Log(title = "消息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, AppMessage appMessage)
    {
        List<AppMessage> list = appMessageService.selectAppMessageList(appMessage);
        ExcelUtil<AppMessage> util = new ExcelUtil<AppMessage>(AppMessage.class);
        util.exportExcel(response, list, "消息数据");
    }

    /**
     * 获取消息详细信息
     */
    @PreAuthorize("@ss.hasPermi('app:message:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(appMessageService.selectAppMessageById(id));
    }

    /**
     * 新增消息
     */
    @PreAuthorize("@ss.hasPermi('app:message:add')")
    @Log(title = "消息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody AppMessage appMessage)
    {
        return toAjax(appMessageService.insertNewAppMessage(appMessage));
    }



    /**
     * 修改消息
     */
    @PreAuthorize("@ss.hasPermi('app:message:edit')")
    @Log(title = "消息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody AppMessage appMessage)
    {
        return toAjax(appMessageService.updateAppMessage(appMessage));
    }

    /**
     * 删除消息
     */
    @PreAuthorize("@ss.hasPermi('app:message:remove')")
    @Log(title = "消息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(appMessageService.deleteAppMessageByIds(ids));
    }
}
