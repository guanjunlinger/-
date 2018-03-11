package com.example.controller.Goods;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.pojo.Goods.Goods;
import com.example.service.Goods.GoodsService;

@Controller
@RequestMapping(value = "/goods")
public class GoodsController {

    @Autowired
    private GoodsService goodsService;


    @ResponseBody
    @RequestMapping(value = "/selectgoods", produces = "application/json;charset=UTF-8")
    public List<Goods> selectById(@RequestParam(value = "product_ID",required = false)Integer product_ID) {
        return goodsService.selectById(product_ID);
    }

    @ResponseBody
    @RequestMapping(value = "/insertgoods", produces = "application/json;charset=UTF-8")
    public int insertGoods(@ModelAttribute("goods") Goods goods) {
        return goodsService.insertGoods(goods);
    }

    @ResponseBody
    @RequestMapping(value = "/updategoods", produces = "application/json;charset=UTF-8")
    public int updateGoods(Goods goods) {
        return goodsService.updateGoods(goods);
    }

}
