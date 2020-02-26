package com.bw.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bw.domain.Goods;
import com.bw.domain.GoodsBrand;
import com.bw.domain.GoodsType;
import com.bw.service.GoodsService;
import com.bw.vo.GoodsVO;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
public class GoodsController {
	@Autowired
	private GoodsService service;
	
	@RequestMapping("list")
	public String list(Model m,GoodsVO goodsVO) {
		if(goodsVO.getPageNum()==null){
			goodsVO.setPageNum(1);
		}
		PageHelper.startPage(goodsVO.getPageNum(),3);
		List<Goods> list=service.getlist(goodsVO);
		PageInfo<Goods> page = new PageInfo<>(list);
		m.addAttribute("page", page);
		m.addAttribute("goodsVO", goodsVO);
		return "list";
	}
	
	@RequestMapping("toAdd")
	public String toAdd(Model m,GoodsVO goodsVO) {
		List<GoodsType> list=service.getpp();
		List<GoodsBrand> bb=service.getzl();
		m.addAttribute("list",list);
		m.addAttribute("bb",bb);
		m.addAttribute("goodsVo",goodsVO);
		return "add";
	}
	
	@ResponseBody
	@RequestMapping("add")
	public Object add(Goods goods) {
		boolean flag=service.addGoods(goods);
		return flag;
	}
}
