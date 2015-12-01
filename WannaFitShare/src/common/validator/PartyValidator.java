package common.validator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.wannafitshare.customer.service.CustomerService;
import com.wannafitshare.customer.service.PartyService;
import com.wannafitshare.vo.Customer;
import com.wannafitshare.vo.Party;

@Component
public class PartyValidator implements Validator {

	@Autowired
	private PartyService service;

	@Override
	public boolean supports(Class<?> clazz) {
		return clazz.isAssignableFrom(Party.class);
	}

	@Override
	public void validate(Object target, Errors error) {

		Party party = (Party) target;
		Party findParty = service.selectPartyByName(party.getPartyName());

		if (!supports(target.getClass())) {
			error.reject("notsupport", "검증할수 없는 객체 입니다.");
			return;
		}

		if (findParty != null) {
			if (findParty.getPartyName().equals(party.getPartyName())) {
				error.rejectValue("partyName", "existParty");
			}
		}

		ValidationUtils.rejectIfEmptyOrWhitespace(error, "partyName",
				"partyRequired", new Object[] { "파티이름" }, "필수입력사항입니다.");

		if (party.getPartyRight() != 1 && party.getPartyRight() != 2
				&& party.getPartyRight() != 3) {
			error.rejectValue("partyRight", "partyRequired",
					new Object[] { "보기권한" }, "권한을 선택하세요");
		}

	}

}
