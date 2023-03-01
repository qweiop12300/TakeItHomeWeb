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
import com.ruoyi.app.domain.AppAnimal;
import com.ruoyi.app.service.IAppAnimalService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 动物信息Controller
 * 
 * @author ruoyi
 * @date 2023-03-01
 */
@RestController
@RequestMapping("/app/animal")
public class AppAnimalController extends BaseController
{
    @Autowired
    private IAppAnimalService appAnimalService;

    /**
     * 查询动物信息列表
     */
    @PreAuthorize("@ss.hasPermi('app:animal:list')")
    @GetMapping("/list")
    public TableDataInfo list(AppAnimal appAnimal)
    {
        startPage();
        List<AppAnimal> list = appAnimalService.selectAppAnimalList(appAnimal);
        return getDataTable(list);
    }

    /**
     * 导出动物信息列表
     */
    @PreAuthorize("@ss.hasPermi('app:animal:export')")
    @Log(title = "动物信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, AppAnimal appAnimal)
    {
        List<AppAnimal> list = appAnimalService.selectAppAnimalList(appAnimal);
        ExcelUtil<AppAnimal> util = new ExcelUtil<AppAnimal>(AppAnimal.class);
        util.exportExcel(response, list, "动物信息数据");
    }

    /**
     * 获取动物信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('app:animal:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(appAnimalService.selectAppAnimalById(id));
    }

    /**
     * 新增动物信息
     */
    @PreAuthorize("@ss.hasPermi('app:animal:add')")
    @Log(title = "动物信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody AppAnimal appAnimal)
    {
        return toAjax(appAnimalService.insertAppAnimal(appAnimal));
    }

    /**
     * 修改动物信息
     */
    @PreAuthorize("@ss.hasPermi('app:animal:edit')")
    @Log(title = "动物信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody AppAnimal appAnimal)
    {
        return toAjax(appAnimalService.updateAppAnimal(appAnimal));
    }

    /**
     * 删除动物信息
     */
    @PreAuthorize("@ss.hasPermi('app:animal:remove')")
    @Log(title = "动物信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(appAnimalService.deleteAppAnimalByIds(ids));
    }
}
