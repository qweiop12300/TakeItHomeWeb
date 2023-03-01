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
import com.ruoyi.app.domain.AppAnimalState;
import com.ruoyi.app.service.IAppAnimalStateService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 动物状态关联Controller
 * 
 * @author ruoyi
 * @date 2023-03-01
 */
@RestController
@RequestMapping("/app/animal_state")
public class AppAnimalStateController extends BaseController
{
    @Autowired
    private IAppAnimalStateService appAnimalStateService;

    /**
     * 查询动物状态关联列表
     */
    @PreAuthorize("@ss.hasPermi('app:animal_state:list')")
    @GetMapping("/list")
    public TableDataInfo list(AppAnimalState appAnimalState)
    {
        startPage();
        List<AppAnimalState> list = appAnimalStateService.selectAppAnimalStateList(appAnimalState);
        return getDataTable(list);
    }

    /**
     * 导出动物状态关联列表
     */
    @PreAuthorize("@ss.hasPermi('app:animal_state:export')")
    @Log(title = "动物状态关联", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, AppAnimalState appAnimalState)
    {
        List<AppAnimalState> list = appAnimalStateService.selectAppAnimalStateList(appAnimalState);
        ExcelUtil<AppAnimalState> util = new ExcelUtil<AppAnimalState>(AppAnimalState.class);
        util.exportExcel(response, list, "动物状态关联数据");
    }

    /**
     * 获取动物状态关联详细信息
     */
    @PreAuthorize("@ss.hasPermi('app:animal_state:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(appAnimalStateService.selectAppAnimalStateById(id));
    }

    /**
     * 新增动物状态关联
     */
    @PreAuthorize("@ss.hasPermi('app:animal_state:add')")
    @Log(title = "动物状态关联", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody AppAnimalState appAnimalState)
    {
        return toAjax(appAnimalStateService.insertAppAnimalState(appAnimalState));
    }

    /**
     * 修改动物状态关联
     */
    @PreAuthorize("@ss.hasPermi('app:animal_state:edit')")
    @Log(title = "动物状态关联", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody AppAnimalState appAnimalState)
    {
        return toAjax(appAnimalStateService.updateAppAnimalState(appAnimalState));
    }

    /**
     * 删除动物状态关联
     */
    @PreAuthorize("@ss.hasPermi('app:animal_state:remove')")
    @Log(title = "动物状态关联", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(appAnimalStateService.deleteAppAnimalStateByIds(ids));
    }
}
