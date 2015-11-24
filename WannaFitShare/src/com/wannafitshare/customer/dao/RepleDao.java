package com.wannafitshare.customer.dao;

import java.util.List;

public interface RepleDao {

	  public List getListCmt(String no);
	  public void createCmt(ReboardDto dto) ;
	  public void deleteCmt(ReboardDto dto);
}
