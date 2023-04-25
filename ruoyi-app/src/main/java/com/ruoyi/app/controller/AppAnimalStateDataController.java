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
import com.ruoyi.app.domain.AppAnimalStateData;
import com.ruoyi.app.service.IAppAnimalStateDataService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 动物状态信息Controller
 * 
 * @author ruoyi
 * @date 2023-02-28
 */
@RestController
@RequestMapping("/app/animal_state_data")
public class AppAnimalStateDataController extends BaseController
{
    @Autowired
    private IAppAnimalStateDataService appAnimalStateDataService;

    /**
     * 查询动物状态信息列表
     */
    @GetMapping("/list")
    public TableDataInfo list(AppAnimalStateData appAnimalStateData)
    {
        startPage();
        List<AppAnimalStateData> list = appAnimalStateDataService.selectAppAnimalStateDataList(appAnimalStateData);
        return getDataTable(list);
    }

    /**
     * 导出动物状态信息列表
     */
    @PreAuthorize("@ss.hasPermi('app:animal_state_data:export')")
    @Log(title = "动物状态信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, AppAnimalStateData appAnimalStateData)
    {
        List<AppAnimalStateData> list = appAnimalStateDataService.selectAppAnimalStateDataList(appAnimalStateData);
        ExcelUtil<AppAnimalStateData> util = new ExcelUtil<AppAnimalStateData>(AppAnimalStateData.class);
        util.exportExcel(response, list, "动物状态信息数据");
    }

    /**
     * 获取动物状态信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('app:animal_state_data:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(appAnimalStateDataService.selectAppAnimalStateDataById(id));
    }

    /**
     * 新增动物状态信息
     */
    @PreAuthorize("@ss.hasPermi('app:animal_state_data:add')")
    @Log(title = "动物状态信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody AppAnimalStateData appAnimalStateData)
    {
        return toAjax(appAnimalStateDataService.insertAppAnimalStateData(appAnimalStateData));
    }

    /**
     * 修改动物状态信息
     */
    @PreAuthorize("@ss.hasPermi('app:animal_state_data:edit')")
    @Log(title = "动物状态信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody AppAnimalStateData appAnimalStateData)
    {
        return toAjax(appAnimalStateDataService.updateAppAnimalStateData(appAnimalStateData));
    }

    /**
     * 删除动物状态信息
     */
    @PreAuthorize("@ss.hasPermi('app:animal_state_data:remove')")
    @Log(title = "动物状态信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(appAnimalStateDataService.deleteAppAnimalStateDataByIds(ids));
    }
}
