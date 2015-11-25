package common.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.wannafitshare.vo.Customer;
import com.wannafitshare.vo.Party;

public class PartyValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		return clazz.isAssignableFrom(Party.class);
	}

	@Override
	public void validate(Object target, Errors error) {

		Party party = (Party) target;

		if (!supports(target.getClass())) {
			error.reject("notsupport", "검증할수 없는 객체 입니다.");
			return;
		}
		ValidationUtils.rejectIfEmptyOrWhitespace(error, "partyName",
				"partyRequired", new Object[] { "파티 이름" }, "필수입력사항입니다.");

		if (party.getPartyRight() != 1 || party.getPartyRight() != 2
				|| party.getPartyRight() != 3) {
			error.rejectValue("partyRight", "partyRequired",
					new Object[] { "보기 권한" }, "권한을 선택하세요");
		}

	}

}
