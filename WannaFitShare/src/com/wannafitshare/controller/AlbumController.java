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
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.wannafitshare.customer.service.PhotoUploadService;
import com.wannafitshare.vo.Customer;
import com.wannafitshare.vo.Photo;
import com.wannafitshare.vo.PhotoUpload;

@Controller
@RequestMapping("/album")
public class AlbumController {

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

	
	//댓글있는 사진보기 컨트롤러  @RequestParam String pictureName
	@RequestMapping("/logincheck/pictureView.do")
	public String pictureView(ModelMap model, @RequestParam String pictureName ,@RequestParam int pictureNumber,HttpSession session){
		
		System.out.println("사진이름 : "+pictureName);
		session.setAttribute("pictureName", pictureName);
		//model.addAttribute("pictureNumber", pictureNumber);
		PhotoUpload photo=service.findPhotoUploadById(pictureNumber);
		session.setAttribute("photo", photo);
		return "/reple/findReple.do";
	}
	// 사진 전송 컨트롤러
	@RequestMapping("/logincheck/submit")
	public String submit(@RequestParam String content, @RequestParam String title, ModelMap model, HttpSession session)
			throws SQLException {

		Customer customer = (Customer) session.getAttribute("loginInfo");
		String id = customer.getCsId(); // cs_id
		int num = 0; // photo_id
		String name = (String) session.getAttribute("party"); // party_name
		Date date = new Date();// photo_date
		num = service.photoNum(); // photo_id
		System.out.println(new PhotoUpload(num,id,name,date,content,title));
		// vo를 DB insert에 추가
		service.addPhotoUpload(new PhotoUpload(num,id,name,date,content,title));
		return "party/test.tiles";
	}

	// 사진 보는 컨트롤러
	@RequestMapping("/logincheck/see.do")
	public String see(HttpSession session, ModelMap model,@RequestParam String partyName) {

		Customer customer = (Customer) session.getAttribute("loginInfo");
		String csId = customer.getCsId();
		session.setAttribute("partyName", partyName);
		System.out.println("파티이름 : " + (String)session.getAttribute("partyName"));
		List<PhotoUpload> listPhotoUpload = service.listPhotoUploadBypartyName(partyName);
		model.addAttribute("listPhotoUpload", listPhotoUpload);
		return "party/test.tiles";
	}
	
	//삭제후 앨범 보는 컨트롤러
	@RequestMapping("/logincheck/viewAfterDelete")
	public String viewAfterDelete(HttpSession session, ModelMap model) {

		Customer customer = (Customer) session.getAttribute("loginInfo");
		String csId = customer.getCsId();
		System.out.println("파티이름 : " + (String)session.getAttribute("partyName"));
		List<PhotoUpload> listPhotoUpload = service.listPhotoUploadBypartyName((String)session.getAttribute("partyName"));
		model.addAttribute("listPhotoUpload", listPhotoUpload);
		return "party/test.tiles";
	}

	// 사진 삭제 컨트롤러
	@RequestMapping("/logincheck/delete.do")
	public String delete(HttpSession session, @RequestParam int deletephotoId) throws Exception {

		Customer customer = (Customer) session.getAttribute("loginInfo");
		String id = customer.getCsId();
		// 비지니스 로직 - 삭제처리
		service.deletePhotoUploadByPhotoId(deletephotoId);
		return "/album/logincheck/viewAfterDelete.do";
	}

	// 건강블로그
	@RequestMapping("/logincheck/submit1")
	public String submit1(@RequestParam String content, @RequestParam String title, ModelMap model, HttpSession session)
			throws SQLException {

		Customer customer = (Customer) session.getAttribute("loginInfo");
		String id = customer.getCsId(); // cs_id
		int num = 0; // photo_id
		String partyName = "건강블로그"; // party_name 앨범 이름
		Date date = new Date();
		num = service.photoNum(); // photo_id 중복피하여 생성
		System.out.println(new PhotoUpload(num,id,partyName,date,content,title));
		// vo를 DB insert에 추가
		service.addPhotoUpload(new PhotoUpload(num,id,partyName,date,content,title));
		// model.addAttribute("content",content);
		return "/album/logincheck/see1.do";
	}

	// 건강블로그
	@RequestMapping("/logincheck/see1.do")
	public String see1(HttpSession session, ModelMap model) {

		Customer customer = (Customer) session.getAttribute("loginInfo");
		String csId = customer.getCsId(); // cs_id
		// String partyName = (String) session.getAttribute("party");
		String name = "건강블로그"; // party_name 앨범 이름
		List<PhotoUpload> listPhotoUpload = service.listPhotoUploadBypartyName(name);

		model.addAttribute("listPhotoUpload1", listPhotoUpload);

		return "party/test2.tiles";
	}

	// 건강 블로그
	@RequestMapping("/logincheck/delete1.do")
	public String delete1(HttpSession session, @RequestParam int deletephotoId) throws Exception {

		Customer customer = (Customer) session.getAttribute("loginInfo");
		String id = customer.getCsId(); // cs_id

		// 비지니스 로직 - 삭제처리
		service.deletePhotoUploadByPhotoId(deletephotoId);
		// 응답
		return "/album/logincheck/see1.do";
	}

	// 건강블로그 네이버 에디터 단일파일업로드
	@RequestMapping("/photoUpload")
	public String photoUpload(HttpServletRequest request, Photo vo) {

		String callback = vo.getCallback();
		String callback_func = vo.getCallback_func();
		String file_result = "";
		try {
			if (vo.getFiledata() != null && !vo.getFiledata().isEmpty()) {
				// 파일이 존재하면
				String original_name = vo.getFiledata().getOriginalFilename();
				String ext = original_name.substring(original_name.lastIndexOf(".") + 1);
				// 파일 기본경로
				String defaultPath = request.getSession().getServletContext().getRealPath("/");
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
				file_result += "&bNewLine=true&sFileName=" + original_name + "&sFileURL=/photo_upload/" + realname;

			} else {
				file_result += "&errstr=error";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("redirect:" + callback + "?callback_func=" + callback_func + file_result);
		return "redirect:" + callback + "?callback_func=" + callback_func + file_result;
	}

	// 건강블로그 네이버 에디터 다중파일업로드
	@RequestMapping("/multiplePhotoUpload")
	public void multiplePhotoUpload(HttpServletRequest request, HttpServletResponse response) {
		try {
			// 파일정보
			String sFileInfo = "";
			// 파일명을 받는다 - 일반 원본파일명
			String filename = request.getHeader("file-name");
			// 파일 확장자
			String filename_ext = filename.substring(filename.lastIndexOf(".") + 1);
			// 확장자를소문자로 변경
			filename_ext = filename_ext.toLowerCase();
			// 파일 기본경로
			String dftFilePath = request.getSession().getServletContext().getRealPath("/");
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
			realFileNm = today + UUID.randomUUID().toString() + filename.substring(filename.lastIndexOf("."));
			String rlFileNm = filePath + realFileNm;

			///////////////// 서버에 파일쓰기 /////////////////
			InputStream is = request.getInputStream();
			OutputStream os = new FileOutputStream(rlFileNm);
			int numRead;
			byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))];
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
			sFileInfo += "&sFileName=" + filename;
			;
			sFileInfo += "&sFileURL=" + "/WannaFitShare/photo_upload/" + realFileNm;
			PrintWriter print = response.getWriter();

			print.print(sFileInfo);
			print.flush();
			print.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}


	
	//앨범에 사진 업로드 
	@RequestMapping("/logincheck/pictureUpload.do")
	public String pictureUpload(@RequestParam MultipartFile upImage, HttpServletRequest request, ModelMap map,
			HttpSession session) throws IOException, SQLException {
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
			upImage.transferTo(upImg);

			/*
			 * ****** File to Copy View(JSP)에 업로드된 이미지 파일명을 request 속성으로 전송
			 * *******************
			 * 
			 * map.addAttribute("image",fileName);
			 * session.setAttribute("image1",fileName);
			 * session.setAttribute("imageContent", fileName); File file = new
			 * File(
			 * "c:\\java2\\WannaFitShare\\WannaFitShare\\WebContent\\upimage",
			 * "ddd"); System.out.println(upImg.exists());
			 * System.out.println(upImg.canWrite()); upImage.transferTo(file);
			 * //copy(x) , move(o)9999+
			 * FileCopyUtils.copy(upImage.getInputStream(),new
			 * FileOutputStream(file));
			 * 
			 */
		}
		Customer customer = (Customer) session.getAttribute("loginInfo");
		String id = customer.getCsId(); // cs_id
		String title = "사진";
		String name = (String) session.getAttribute("partyName"); // party_name
		System.out.println(name);
		Date date = new Date();
		int num = 0; // photo_id
		num = service.photoNum(); // photo_id 중복피하여 생성

		PhotoUpload load = new PhotoUpload(num,id,name,date,fileName,title);
		// vo를 DB insert에 추가
		service.addPhotoUpload(load);
		// model.addAttribute("content",content);
		// session.setAttribute("image1",load);
		return "customer/customer_main2.tiles";
	}

}// class