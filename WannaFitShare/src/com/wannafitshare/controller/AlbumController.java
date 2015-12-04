package com.wannafitshare.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.wannafitshare.customer.service.PhotoUploadService;
import com.wannafitshare.customer.service.RepleService;
import com.wannafitshare.vo.Customer;
import com.wannafitshare.vo.Photo;
import com.wannafitshare.vo.PhotoUpload;

@Controller
@RequestMapping("/album")
public class AlbumController {

	@Autowired
	private RepleService repleService;
	@Autowired
	private PhotoUploadService service;

	@RequestMapping("/photoMain")
	public String photoMain() {
		return "photo/photo_main.tiles";
	}

	@RequestMapping("/logincheck/write")
	public String write(HttpSession session) {

		return "picture/write2.tiles";
	}

	@RequestMapping("/photoSee.do")
	public String photoSee(HttpSession session) {

		return "picture/photo_see.tiles";
	}

	@RequestMapping("/logincheck/submit1")
	public String submit1(@RequestParam String content,
			@RequestParam String title, ModelMap model, HttpSession session)
					throws SQLException {

		Customer customer = (Customer) session.getAttribute("loginInfo");
		String id = customer.getCsId(); // cs_id
		int num = 0; // photo_id
		String partyName = "건강블로그"; // party_name 앨범 이름
		Date date = new Date();
		num = service.photoNum(); // photo_id 중복피하여 생성
		System.out.println(
				new PhotoUpload(title, num, partyName, id, date, content));
		// vo를 DB insert에 추가
		service.addPhotoUpload(
				new PhotoUpload(title, num, partyName, id, date, content));
		// model.addAttribute("content",content);
		return "/album/logincheck/see1.do";
	}

	@RequestMapping("/logincheck/submit")
	public String submit(@RequestParam String content,
			@RequestParam String title, ModelMap model, HttpSession session)
					throws SQLException {

		Customer customer = (Customer) session.getAttribute("loginInfo");
		String id = customer.getCsId(); // cs_id
		int num = 0; // photo_id
		String name = (String) session.getAttribute("party"); // party_name
		Date date = new Date();
		num = service.photoNum(); // photo_id 중복피하여 생성
		System.out
				.println(new PhotoUpload(title, num, name, id, date, content));
		// vo를 DB insert에 추가
		service.addPhotoUpload(
				new PhotoUpload(title, num, name, id, date, content));
		// model.addAttribute("content",content);
		return "/album/logincheck/see.do";
	}

	/* 내가 올린 사진 보기 */
	@RequestMapping("/logincheck/see1.do")
	public String see1(HttpSession session, ModelMap model) {

		Customer customer = (Customer) session.getAttribute("loginInfo");
		String csId = customer.getCsId(); // cs_id
		//String partyName = (String) session.getAttribute("party");
		String name = "건강블로그"; // party_name 앨범 이름
		List<PhotoUpload> listPhotoUpload = service
				.listPhotoUploadBypartyName(name);

		model.addAttribute("listPhotoUpload1", listPhotoUpload);

		return "party/test2.tiles";
	}

	/* 내가 올린 사진 보기 */
	@RequestMapping("/logincheck/see.do")
	public String see(HttpSession session, ModelMap model) {

		Customer customer = (Customer) session.getAttribute("loginInfo");
		String csId = customer.getCsId(); // cs_id
		String partyName = (String) session.getAttribute("party");

		List<PhotoUpload> listPhotoUpload = service
				.listPhotoUploadBypartyName(partyName);
				/*
				 * model.addAttribute("listPhotoUpload", listPhotoUpload); return
				 * "party/test.tiles";
				 */

		/*
		 * List <PhotoUpload> list = service.listPhotoUpload(csId); List
		 * <PhotoUpload> listBypartyName=null; //사용자가 만든 모든 사진 리스트들에서 partyName에
		 * 해당하는 사진들을 뽑아야한다. Iterator itr = list.iterator();
		 * while(itr.hasNext()){ PhotoUpload o = (PhotoUpload)itr.next();
		 * if(o.getPartyName().equals(partyName)){ listBypartyName.add(o); } }
		 */
		// session.setAttribute("party", partyName);
		model.addAttribute("listPhotoUpload", listPhotoUpload);
		// model.addAttribute("partyName", partyName);
		// System.out.println(listBypartyName);
		return "party/test.tiles";
	}

	/*
	 * 나만의 앨범에서 사진 보기
	 * 
	 * @RequestMapping("/logincheck/mysee.do") public String mysee(@RequestParam
	 * String partyName, ModelMap model, HttpSession session) { ======= return
	 * "picture/write2.tiles"; }
	 * 
	 * @RequestMapping("/photoSee.do") public String photoSee(HttpSession
	 * session){ return "picture/photo_see.tiles"; }
	 * 
	 * @RequestMapping("/logincheck/submit") public String submit(@RequestParam
	 * String content , @RequestParam String title ,ModelMap model, HttpSession
	 * session) throws SQLException{
	 * 
	 * Customer customer = (Customer) session.getAttribute("loginInfo"); String
	 * id = customer.getCsId(); //cs_id int num=0; // photo_id String name =
	 * (String) session.getAttribute("party"); //party_name Date date = new
	 * Date(); num=service.photoNum(); //photo_id 중복피하여 생성
	 * 
	 * //vo를 DB insert에 추가 service.addPhotoUpload(new
	 * PhotoUpload(title,num,name,id,date,content));
	 * //model.addAttribute("content",content); return
	 * "/album/logincheck/see.do"; }
	 * 
	 * /* 내가 올린 사진 보기
	 * 
	 * @RequestMapping("/logincheck/see.do") public String see(HttpSession
	 * session, ModelMap model) {
	 * 
	 * Customer customer = (Customer) session.getAttribute("loginInfo"); String
	 * csId = customer.getCsId(); //cs_id String partyName= (String)
	 * session.getAttribute("party");
	 * 
	 * List <PhotoUpload> listPhotoUpload =
	 * service.listPhotoUploadBypartyName(partyName);
	 * 
	 * model.addAttribute("listPhotoUpload", listPhotoUpload); return
	 * "party/test.tiles";
	 * 
	 * List <PhotoUpload> list = service.listPhotoUpload(csId); List
	 * <PhotoUpload> listBypartyName=null; //사용자가 만든 모든 사진 리스트들에서 partyName에
	 * 해당하는 사진들을 뽑아야한다. Iterator itr = list.iterator(); while(itr.hasNext()){
	 * PhotoUpload o = (PhotoUpload)itr.next();
	 * if(o.getPartyName().equals(partyName)){ listBypartyName.add(o); } }
	 * //session.setAttribute("party", partyName);
	 * model.addAttribute("listPhotoUpload",listPhotoUpload);
	 * //model.addAttribute("partyName", partyName);
	 * //System.out.println(listBypartyName); return "party/test.tiles"; }
	 */

	/*
	 * 나만의 앨범에서 사진 보기
	 * 
	 * @RequestMapping("/logincheck/mysee.do") public String mysee(@RequestParam
	 * String partyName, ModelMap model, HttpSession session) { >>>>>>> branch
	 * 'master' of https://github.com/godsoojon/wannafitProject.git
	 * 
	 * Customer customer = (Customer) session.getAttribute("loginInfo"); String
	 * csId = customer.getCsId(); //cs_id List <PhotoUpload> list =
	 * service.listPhotoUpload(csId); List <PhotoUpload> listBypartyName=null;
	 * //사용자가 만든 모든 사진 리스트들에서 partyName에 해당하는 사진들을 뽑아야한다. Iterator itr =
	 * list.iterator(); while(itr.hasNext()){ PhotoUpload o =
	 * (PhotoUpload)itr.next(); if(o.getPartyName().equals(partyName)){
	 * listBypartyName.add(o); } } model.addAttribute("listPhotoUpload",
	 * listBypartyName); System.out.println(listBypartyName); return
	 * "party/test.tiles"; }
	 */

	@RequestMapping("/logincheck/delete.do")
	public String delete(HttpSession session, @RequestParam int deletephotoId)
			throws Exception {

		Customer customer = (Customer) session.getAttribute("loginInfo");
		String id = customer.getCsId(); // cs_id

		// 비지니스 로직 - 삭제처리
		service.deletePhotoUploadByPhotoId(deletephotoId);
		// 응답
		return "/album/logincheck/see.do";
	}

	@RequestMapping("/logincheck/delete1.do")
	public String delete1(HttpSession session, @RequestParam int deletephotoId)
			throws Exception {

		Customer customer = (Customer) session.getAttribute("loginInfo");
		String id = customer.getCsId(); // cs_id

		// 비지니스 로직 - 삭제처리
		service.deletePhotoUploadByPhotoId(deletephotoId);
		// 응답
		return "/album/logincheck/see1.do";
	}

	// 단일파일업로드
	@RequestMapping("/photoUpload")
	public String photoUpload(HttpServletRequest request, Photo vo) {

		String callback = vo.getCallback();
		String callback_func = vo.getCallback_func();
		String file_result = "";
		try {
			if (vo.getFiledata() != null && !vo.getFiledata().isEmpty()) {
				// 파일이 존재하면
				String original_name = vo.getFiledata().getOriginalFilename();
				String ext = original_name
						.substring(original_name.lastIndexOf(".") + 1);
				// 파일 기본경로
				String defaultPath = request.getSession().getServletContext()
						.getRealPath("/");
				// 파일 기본경로 _ 상세경로
				String path = defaultPath + "photo_upload" + File.separator;
				File file = new File(path);
				System.out.println("path:" + path);
				// 디렉토리 존재하지 않을경우 디렉토리 생성
				if (!file.exists()) {
					file.mkdirs();
				}
				// 서버에 업로드 할 파일명(한글문제로 인해 원본파일은 올리지 않는것이 좋음)
				String realname = UUID.randomUUID().toString() + "." + ext;
				///////////////// 서버에 파일쓰기 /////////////////
				vo.getFiledata().transferTo(new File(path + realname));
				file_result += "&bNewLine=true&sFileName=" + original_name
						+ "&sFileURL=/photo_upload/" + realname;

			} else {
				file_result += "&errstr=error";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("redirect:" + callback + "?callback_func="
				+ callback_func + file_result);
		return "redirect:" + callback + "?callback_func=" + callback_func
				+ file_result;
	}

	// 다중파일업로드
	@RequestMapping("/multiplePhotoUpload")
	public void multiplePhotoUpload(HttpServletRequest request,
			HttpServletResponse response) {
		try {
			// 파일정보
			String sFileInfo = "";
			// 파일명을 받는다 - 일반 원본파일명
			String filename = request.getHeader("file-name");
			// 파일 확장자
			String filename_ext = filename
					.substring(filename.lastIndexOf(".") + 1);
			// 확장자를소문자로 변경
			filename_ext = filename_ext.toLowerCase();
			// 파일 기본경로
			String dftFilePath = request.getSession().getServletContext()
					.getRealPath("/");
			// 파일 기본경로 _ 상세경로
			String filePath = dftFilePath + "photo_upload" + File.separator;
			File file = new File(filePath);
			if (!file.exists()) {
				file.mkdirs();
			}
			long timeMilis = System.currentTimeMillis();
			String realFileNm = "";
			SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
			// 매번 파일이름을 다르게하기위해 TimeMillis 사용
			String today = formatter.format(new java.util.Date()) + timeMilis;
			realFileNm = today + UUID.randomUUID().toString()
					+ filename.substring(filename.lastIndexOf("."));
			String rlFileNm = filePath + realFileNm;
			// System.out.println("파일경로 : "+filePath);
			// System.out.println("파일 이름 : "+realFileNm);

			///////////////// 서버에 파일쓰기 /////////////////
			InputStream is = request.getInputStream();
			OutputStream os = new FileOutputStream(rlFileNm);
			int numRead;
			byte b[] = new byte[Integer
					.parseInt(request.getHeader("file-size"))];
			while ((numRead = is.read(b, 0, b.length)) != -1) {
				os.write(b, 0, numRead);
			}
			if (is != null) {
				is.close();
			}
			os.flush();
			os.close();
			///////////////// 서버에 파일쓰기 /////////////////
			// 정보 출력
			sFileInfo += "&bNewLine=true";
			// img 태그의 title 속성을 원본파일명으로 적용시켜주기 위함
			sFileInfo += "&sFileName=" + filename;;
			sFileInfo += "&sFileURL=" + "/WannaFitShare/photo_upload/"
					+ realFileNm;
			PrintWriter print = response.getWriter();
			// System.out.println(sFileInfo);
			print.print(sFileInfo);
			print.flush();
			print.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@RequestMapping("/logincheck/singleup1.do") // 확장자 .do는 생략 가능.
	// input type="file"로 넘어온 요청파라미터는 MultipartFile 타입의 변수로 받으면 된다.
	public String singleUpload(@RequestParam MultipartFile upImage,
			HttpServletRequest request, ModelMap map, HttpSession session)
					throws IOException, SQLException {
		String fileName = null;
		// null : upImage name의 요청파라미터가 없는 경우
		// isEmpty()-true : 사용자가 파일을 전송 하지 않은 경우
		if (upImage != null && !upImage.isEmpty()) { // 업로드된 파일이 있다.
			// 업로드된 파일의 정보를 조회
			fileName = upImage.getOriginalFilename();
			long fileSize = upImage.getSize();
			System.out.println(fileName + " - " + fileSize);
			// long timeMilis = System.currentTimeMillis();

			// 파일을 임시저장경로에서 최종 저장경로로 이동.
			// %TOMCAT_HOME%\\webapps\\applicationRoot_dir\\upimage
			String dir = request.getServletContext().getRealPath("/upimage");
			// /의 의미 -> application root. application_root/upimage의 실제 파일 경로를
			// String값을 return.
			System.out.println(dir);

			File upImg = new File(dir, fileName);
			// File file = new File("c:\\java2\\down",fileName);

			// View(JSP)에 업로드된 이미지 파일명을 request 속성으로 전송
			// map.addAttribute("image",fileName);
			// session.setAttribute("image1",fileName);
			// session.setAttribute("imageContent", fileName);
			// File file = new
			// File("c:\\java2\\WannaFitShare\\WannaFitShare\\WebContent\\upimage","ddd");
			// System.out.println(upImg.exists());
			// System.out.println(upImg.canWrite());
			// upImage.transferTo(file); //copy(x) , move(o)9999+
			// FileCopyUtils.copy(upImage.getInputStream(),new
			// FileOutputStream(file));
			upImage.transferTo(upImg);
		}
		Customer customer = (Customer) session.getAttribute("loginInfo");
		String id = customer.getCsId(); // cs_id
		String title = "사진";
		int num = 0; // photo_id
		String name = (String) session.getAttribute("party"); // party_name
		Date date = new Date();
		num = service.photoNum(); // photo_id 중복피하여 생성

		PhotoUpload load = new PhotoUpload(title, num, name, id, date,
				fileName);
		// vo를 DB insert에 추가
		service.addPhotoUpload(load);
		// model.addAttribute("content",content);
		// session.setAttribute("image1",load);
		return "customer/customer_main2.tiles";
	}

	/*
	 * @RequestMapping("/logincheck/singleup1.do") //확장자 .do는 생략 가능. //input
	 * type="file"로 넘어온 요청파라미터는 MultipartFile 타입의 변수로 받으면 된다. public String
	 * singleUpload(@RequestParam MultipartFile upImage, HttpServletRequest
	 * request,ModelMap map,HttpSession session) throws IOException{
	 * 
	 * //null : upImage name의 요청파라미터가 없는 경우 //isEmpty()-true : 사용자가 파일을 전송 하지 않은
	 * 경우 if(upImage != null && !upImage.isEmpty()){ // 업로드된 파일이 있다. //업로드된 파일의
	 * 정보를 조회 String fileName = upImage.getOriginalFilename(); long fileSize =
	 * upImage.getSize(); System.out.println(fileName+" - "+fileSize); //long
	 * timeMilis = System.currentTimeMillis();
	 * 
	 * //파일을 임시저장경로에서 최종 저장경로로 이동.
	 * //%TOMCAT_HOME%\\webapps\\applicationRoot_dir\\upimage String dir =
	 * request.getServletContext().getRealPath("/upimage"); // /의 의미 ->
	 * application root. application_root/upimage의 실제 파일 경로를 String값을 return.
	 * System.out.println(dir);
	 * 
	 * File upImg = new File(dir,fileName); //File file = new
	 * File("c:\\java2\\down",fileName);
	 * 
	 * //View(JSP)에 업로드된 이미지 파일명을 request 속성으로 전송
	 * //map.addAttribute("image",fileName);
	 * //session.setAttribute("image1",fileName);
	 * session.setAttribute("imageContent", fileName); //File file = new
	 * File("c:\\java2\\WannaFitShare\\WannaFitShare\\WebContent\\upimage","ddd"
	 * ); //System.out.println(upImg.exists());
	 * //System.out.println(upImg.canWrite()); //upImage.transferTo(file);
	 * //copy(x) , move(o)9999+
	 * //FileCopyUtils.copy(upImage.getInputStream(),new
	 * FileOutputStream(file)); upImage.transferTo(upImg); } return
	 * "/album/logincheck/submit1.do"; //이동 }
	 * 
	 * @RequestMapping("/logincheck/submit1.do") public String submit1(ModelMap
	 * model, HttpSession session) throws SQLException{
	 * 
	 * Customer customer = (Customer) session.getAttribute("loginInfo"); String
	 * id = customer.getCsId(); //cs_id String title="사진"; int num=0; //
	 * photo_id String name = (String) session.getAttribute("party");
	 * //party_name Date date = new Date(); num=service.photoNum(); //photo_id
	 * 중복피하여 생성 model. PhotoUpload load = new
	 * PhotoUpload(title,num,name,id,date,imageContent); // vo를 DB insert에 추가
	 * service.addPhotoUpload(load); // model.addAttribute("content",content);
	 * //session.setAttribute("image1",load); return
	 * "customer/customer_main2.tiles"; }
	 */
}// class