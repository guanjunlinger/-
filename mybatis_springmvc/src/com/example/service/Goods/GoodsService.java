package com.example.service.Goods;

import java.util.List;

import com.example.pojo.Goods.Goods;

public interface GoodsService {

	public List<Goods> selectById(Integer product_ID);
	
	public int insertGoods(Goods goods);
	
	public int updateGoods(Goods goods);
}
