package com.bw.dao;

import java.util.List;

import com.bw.domain.Goods;
import com.bw.domain.GoodsBrand;
import com.bw.domain.GoodsType;
import com.bw.vo.GoodsVO;

public interface GoodsDao {

	List<Goods> getlist(GoodsVO goodsVO);

	List<GoodsType> getpp();

	List<GoodsBrand> getzl();

	boolean addGoods(Goods goods);

}
