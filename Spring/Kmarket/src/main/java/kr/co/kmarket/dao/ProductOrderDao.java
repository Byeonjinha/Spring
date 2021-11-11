package kr.co.kmarket.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import kr.co.kmarket.vo.CategoriesVo;
import kr.co.kmarket.vo.ProductOrderVo;
import kr.co.kmarket.vo.ProductVo;
import kr.co.kmarket.vo.SearchVo;

@Repository
public interface ProductOrderDao {

	public void insertOrder(ProductOrderVo vo);
	public void insertOrderDetail(int orderId, int productCode);
	
	public void selectOrder();
	public void selectOrders();
	public void updateOrder();
	public void deleteOrder();
}
