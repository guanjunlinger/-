package com.example.service.Goods.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.example.dao.Goods.GoodsDao;
import com.example.pojo.Goods.Goods;
import com.example.service.Goods.GoodsService;

@Service
public class GoodsServiceImpl implements GoodsService{

	@Autowired
	private GoodsDao goodsDao;
	
	@Transactional(propagation=Propagation.REQUIRES_NEW,isolation=Isolation.REPEATABLE_READ)
	@Override
	public List<Goods> selectById(Integer product_ID) {
		return goodsDao.selectById(product_ID);
	}

	
	@Transactional(propagation=Propagation.REQUIRES_NEW,isolation=Isolation.REPEATABLE_READ)
	@Override
	public int insertGoods(Goods goods) {
		// TODO Auto-generated method stub
		return goodsDao.insertGoods(goods);
	}


	@Transactional(propagation=Propagation.REQUIRES_NEW,isolation=Isolation.REPEATABLE_READ)
	@Override
	public int updateGoods(Goods goods) {
		// TODO Auto-generated method stub
		return goodsDao.updateGoods(goods);
	}

}
