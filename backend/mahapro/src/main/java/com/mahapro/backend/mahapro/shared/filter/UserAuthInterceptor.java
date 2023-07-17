package com.mahapro.backend.mahapro.shared.filter;

import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.auth.FirebaseToken;
import com.mahapro.backend.mahapro.model.User.User;
import com.mahapro.backend.mahapro.service.UserService;
import com.mahapro.backend.mahapro.shared.config.FirebaseAuthConfig;
import com.mahapro.backend.mahapro.shared.provider.JwtTokenProvider;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

@Component
public class UserAuthInterceptor implements HandlerInterceptor {

    @Autowired
    FirebaseAuth firebaseAuth;

    @Autowired
    UserService userService;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        try {
            String jwtToken = JwtTokenProvider.getToken(request.getHeader("Authorization"));
            FirebaseToken token = firebaseAuth.verifyIdToken(jwtToken);
            String uid = token.getUid();

            User user = userService.findByFirebaseUserId(uid);

            if(user != null) {
               return true;
            } else {
                return false;
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return false;
        }
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        HandlerInterceptor.super.postHandle(request, response, handler, modelAndView);
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
        HandlerInterceptor.super.afterCompletion(request, response, handler, ex);
    }
}
