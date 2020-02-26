package com.bw.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bw.dao.GoodsDao;
import com.bw.domain.Goods;
import com.bw.domain.GoodsBrand;
import com.bw.domain.GoodsType;
import com.bw.service.GoodsService;
import com.bw.vo.GoodsVO;
@Service
public class GoodsServiceImpl implements GoodsService {
	@Autowired
	private GoodsDao dao;

	@Override
	public List<Goods> getlist(GoodsVO goodsVO) {
		// TODO Auto-generated method stub
		return dao.getlist(goodsVO);
	}

	@Override
	public List<GoodsType> getpp() {
		// TODO Auto-generated method stub
		return dao.getpp();
	}

	@Override
	public List<GoodsBrand> getzl() {
		// TODO Auto-generated method stub
		return dao.getzl();
	}

	@Override
	public boolean addGoods(Goods goods) {
		// TODO Auto-generated method stub
		return dao.addGoods(goods);
	}
}
