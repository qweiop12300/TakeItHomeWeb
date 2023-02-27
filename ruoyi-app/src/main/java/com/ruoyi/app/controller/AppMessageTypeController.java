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
import com.ruoyi.app.domain.AppMessageType;
import com.ruoyi.app.service.IAppMessageTypeService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 信息类型Controller
 * 
 * @author ruoyi
 * @date 2023-02-27
 */
@RestController
@RequestMapping("/app/message_type")
public class AppMessageTypeController extends BaseController
{
    @Autowired
    private IAppMessageTypeService appMessageTypeService;

    /**
     * 查询信息类型列表
     */
    @PreAuthorize("@ss.hasPermi('app:message_type:list')")
    @GetMapping("/list")
    public TableDataInfo list(AppMessageType appMessageType)
    {
        startPage();
        List<AppMessageType> list = appMessageTypeService.selectAppMessageTypeList(appMessageType);
        return getDataTable(list);
    }

    /**
     * 导出信息类型列表
     */
    @PreAuthorize("@ss.hasPermi('app:message_type:export')")
    @Log(title = "信息类型", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, AppMessageType appMessageType)
    {
        List<AppMessageType> list = appMessageTypeService.selectAppMessageTypeList(appMessageType);
        ExcelUtil<AppMessageType> util = new ExcelUtil<AppMessageType>(AppMessageType.class);
        util.exportExcel(response, list, "信息类型数据");
    }

    /**
     * 获取信息类型详细信息
     */
    @PreAuthorize("@ss.hasPermi('app:message_type:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(appMessageTypeService.selectAppMessageTypeById(id));
    }

    /**
     * 新增信息类型
     */
    @PreAuthorize("@ss.hasPermi('app:message_type:add')")
    @Log(title = "信息类型", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody AppMessageType appMessageType)
    {
        return toAjax(appMessageTypeService.insertAppMessageType(appMessageType));
    }

    /**
     * 修改信息类型
     */
    @PreAuthorize("@ss.hasPermi('app:message_type:edit')")
    @Log(title = "信息类型", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody AppMessageType appMessageType)
    {
        return toAjax(appMessageTypeService.updateAppMessageType(appMessageType));
    }

    /**
     * 删除信息类型
     */
    @PreAuthorize("@ss.hasPermi('app:message_type:remove')")
    @Log(title = "信息类型", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(appMessageTypeService.deleteAppMessageTypeByIds(ids));
    }
}
