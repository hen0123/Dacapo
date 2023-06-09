package kr.spring.mapper;

import org.apache.ibatis.annotations.Mapper;

import kr.spring.entity.Posture;

@Mapper
public interface PostureMapper {
   public void action(Posture mvo);
   
   public void run(Posture mvo);
 
   public Posture result(String v);
}