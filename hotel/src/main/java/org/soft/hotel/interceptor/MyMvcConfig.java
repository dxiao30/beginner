package org.soft.hotel.interceptor;

import org.springframework.context.annotation.Configuration;
import org.springframework.core.Ordered;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

/**
 * 指定拦截器
 * @author Administrator
 *
 */
@Configuration
public class MyMvcConfig extends WebMvcConfigurerAdapter {

	
	/**
	 * 默认首页配置
	 */
	@Override
    public void addViewControllers(ViewControllerRegistry registry) {
            registry.addViewController("/").setViewName("/toPage/staff/staffLogin");
        registry.setOrder(Ordered.HIGHEST_PRECEDENCE);
        super.addViewControllers(registry);
    } 
	
	/**
     * interceptor配置
     */
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(new SessionInterceptor())
                //添加需要验证登录用户操作权限的请求
                .addPathPatterns("/**")
                //排除不需要验证登录用户操作权限的请求
                .excludePathPatterns("staffLogin")
                .excludePathPatterns("staff/staffLogin")
                .excludePathPatterns("/toPage/staff/staffLogin")               
                .excludePathPatterns("/view/staff/staffLogin")
                .excludePathPatterns("/view/gateway/**")
                .excludePathPatterns("/gatewayShowAllRoomType/*")
                .excludePathPatterns("/css/**")
                .excludePathPatterns("/userCancellation")
                .excludePathPatterns("/userLogin")
                .excludePathPatterns("/userRegist")
                .excludePathPatterns("/clientLogin")
                .excludePathPatterns("/clientRegist")
                .excludePathPatterns("/getMessage/**")
                .excludePathPatterns("/js/**")
                .excludePathPatterns("/img/**")
        		.excludePathPatterns("/fonts/**");
    }
}
