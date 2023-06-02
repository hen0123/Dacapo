package kr.spring.controller;

import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.spring.entity.Pay;
import kr.spring.mapper.PayMapper;

@Controller
public class PayController {
	
	@Autowired
	private PayMapper payMapper;
	
	// 결제창으로 이동
    @RequestMapping("/pay.do")
    public void pay(Pay pay, HttpServletResponse response) {
       
       payMapper.InsertPay(pay);
       List<Pay> list = payMapper.getPayMerchatName(pay);
       System.out.println("페이 객체리스트 가져오기 성공");
       System.out.println(list.get(list.size()-1).getMerchantName()); 
       
       // 결제 쿠키값 넣어주는 기능(한번 구매는 한달 이용)
       try {
       Cookie cookie = new Cookie(URLEncoder.encode(list.get(list.size()-1).getMerchantName(), "UTF-8"),
             list.get(list.size()-1).getMerchantName());
       cookie.setMaxAge(120);
       response.addCookie(cookie);
       System.out.println("쿠기 설정 성공");
       } catch (Exception e) {
          System.out.println("쿠기 설정 실패");
       }
    }
    
 // 결제내역 페이지 이동 + 결제내역 데이터 뿌려주기
    @RequestMapping("/payHistory.do/{memID}")
    public String payHistory(@PathVariable("memID") String memID, Model model) {
       
    	System.out.println("작동됨");
       List<Pay> list = payMapper.getPay(memID);
       
       // 결제 총액 더해주는 코드
       int totalAmount = 0;
       for(Pay pay : list) {
          totalAmount += pay.getAmount();
       }
       
       model.addAttribute("list", list);
       model.addAttribute("totalAmount", totalAmount);
       
       return "pay/payHistory";
    }
    
    
	
}
