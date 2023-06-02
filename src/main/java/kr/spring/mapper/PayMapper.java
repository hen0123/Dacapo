package kr.spring.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.spring.entity.Pay;

@Mapper
public interface PayMapper {

	void InsertPay(Pay pay);

	List<Pay> getPay(String memID);

	List<Pay> getPayMerchatName(Pay pay);
}
