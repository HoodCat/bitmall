package com.cafe24.bitmall.controller.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cafe24.bitmall.security.Auth;
import com.cafe24.bitmall.service.OptionService;
import com.cafe24.bitmall.vo.SmallOptionVo;

@Auth
@ResponseBody
@Controller("optionAPIController")
@RequestMapping("admin/api/small_option")
public class SmallOptionController {
    
    @Autowired
    private OptionService optionService;
    
    @RequestMapping("insert")
    public SmallOptionVo insert(@ModelAttribute SmallOptionVo sOptionVo) {
        return optionService.addSmallOption(sOptionVo);
    }
}
