package com.example.dao.Goods;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.example.pojo.Goods.Goods;

@Repository
public interface GoodsDao {

	public List<Goods> selectById(@Param("product_ID")Integer product_ID);
	public int insertGoods(Goods goods);
	public int updateGoods(Goods goods);
}
