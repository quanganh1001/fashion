package project.fashion.admin.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import project.fashion.admin.Response.AccountResponse;
import project.fashion.admin.model.entity.Account;
import project.fashion.admin.model.entity.CustomUserDetail;
import project.fashion.admin.model.repository.AccountRepo;

import java.util.Collection;
import java.util.HashSet;
import java.util.stream.Collectors;

@Service
public class CustomUserDetailService implements UserDetailsService {
    @Autowired
    private AccountRepo accountRepo;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        Account account = accountRepo.findByUserName(username);
        if(account == null){
            throw new UsernameNotFoundException("Sai");
        }

        var accountResponse = AccountResponse.fromAccount(account);

        Collection<GrantedAuthority> grantedAuthoritySet = new HashSet<>();
        String role = account.getRole().name();

        grantedAuthoritySet.add(new SimpleGrantedAuthority(role));

        return new CustomUserDetail(account,grantedAuthoritySet);
    }
}
