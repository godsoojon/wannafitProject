package common.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.wannafitshare.vo.Customer;

public class CustomerValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		// TODO Auto-generated method stub
		return clazz.isAssignableFrom(Customer.class);
	}

	@Override
	//등록/수정 공통 체크.
	public void validate(Object target, Errors error) {
		ValidationUtils.rejectIfEmptyOrWhitespace(error, "csId", "required",
				new Object[]{"고객 ID"}, "필수입력사항입니다.");
		ValidationUtils.rejectIfEmptyOrWhitespace(error, "csPassword",
				"requried", new Object[]{"패스워드"}, "필수입력사항입니다.");
		ValidationUtils.rejectIfEmptyOrWhitespace(error, "csName", "required",
				new Object[]{"고객 이름"}, "필수입력사항입니다.");
		ValidationUtils.rejectIfEmptyOrWhitespace(error, "csEmail", "required",
				new Object[]{"이메일주소"}, "필수입력사항입니다.");

	}

}
