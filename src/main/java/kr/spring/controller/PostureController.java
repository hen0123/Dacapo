package kr.spring.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.lang.ProcessBuilder.Redirect;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mysql.cj.Session;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.spring.entity.Posture;
import kr.spring.mapper.PostureMapper;
import kr.spring.entity.Member;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;



@Controller
public class PostureController {

   @Autowired
   private PostureMapper posturemapper;
   // 자세진단 페이지로로 이동
      @RequestMapping("/posture")
      public String main() {
         return "posture/posture";
      }
      
      @RequestMapping("/posture_upload")
      public String upload() {
         return "posture/posture_upload";
      }
      
      @GetMapping("/posture.success")
      public String success(){
         return "posture/posture_success";
          }
      
      @PostMapping("/posture.action")
       public String upload(HttpServletRequest request, RedirectAttributes rttr, HttpSession session) throws IOException {
         // 파일 업로드new 
         MultipartRequest multi = null;
         
         int fileMaxSize = 100000*1024*1024; // 파일최대크기 - 10GB
         String savePath = request.getRealPath("resources/upload"); // 파일이 저장될 위치 경로
         String encType = "UTF-8"; // 인코딩 타입
         DefaultFileRenamePolicy dfrp = new DefaultFileRenamePolicy();
         System.out.println(savePath);
         multi = new MultipartRequest(request, savePath, fileMaxSize, encType, dfrp); // 요청데이터, 저장경로, 최대크기, 인코딩, 파일명중복제거 
         
         String newfile="";
         
         File file =multi.getFile("file");
         // 사용자가 파일을 올렸을떄
         String ext = file.getName();
         System.out.println(ext);
            
         //.뒤에 있는 확장자만 가져오기
         ext = ext.substring(ext.lastIndexOf(".")+1);
         System.out.println(ext);
            
         // .뒤에 확장자를 대문자로 다 바꾸기
         ext = ext.toUpperCase();
         System.out.println(ext);
            
         newfile = file.getName();
         Member mvo = (Member)session.getAttribute("mvo");
         
         Posture vo = new Posture();
         vo.setMemID(mvo.getMemID());
         vo.setVideo(newfile);
            
         posturemapper.action(vo);
         session.setAttribute("video", newfile);
         
         return "redirect:/posture";
   }
      
      @GetMapping("/posture.run")
      public String run(HttpServletRequest request, RedirectAttributes rttr, HttpSession session, Model model){
            
           String video = (String)session.getAttribute("video");
           MultiValueMap<String,String> parameters = new LinkedMultiValueMap<>();
           parameters.add("video", video );
           
//           String url = "http://127.0.0.1:5002/result";
//           ResponseEntity<String> res = new RestTemplate().postForEntity(url, parameters, String.class);
//           System.out.println(res.getBody());
//           String data = res.getBody();
//           String[] comment = data.split(",");
//           String[] comment1 = comment[0].split(":");
//           String[] comment2 = comment[1].split(":");
//           String[] comment3 = comment[2].split(":");
//           String[] comment4 = comment[3].split(":");
//           String[] TackBack = comment[4].split(":",2);
//           String[] Swing = comment[5].split(":",2);
//           String[] Impact = comment[6].split(":",2);
//           String[] Follow = comment[7].split(":",2);
//           String[] score = comment[8].split(":");
//         
//           // Posture 객체 생성
//           Posture vo = new Posture();
//           Member mvo = (Member)session.getAttribute("mvo");
//           String v = (String)session.getAttribute("video");
//           vo.setMemID(mvo.getMemID());
//           vo.setVideo(v);
//           vo.setComment_1(comment1[1]);
//           vo.setComment_2(comment2[1]);
//           vo.setComment_3(comment3[1]);
//           vo.setComment_4(comment4[1]);
//           vo.setTakeBack(TackBack[1]);
//           vo.setSwing(Swing[1]);
//           vo.setImpact(Impact[1]);
//           vo.setFollowThrough(Follow[1]);
//           vo.setScore(score[1]);
//           posturemapper.run(vo);
//    	  
//    	   vo = posturemapper.result(v);
//    	   model.addAttribute("vo",vo);
    	 
           
           return  "posture/posture_result";
      }
   
}
