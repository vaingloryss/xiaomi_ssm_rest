import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * @author vaingloryss
 * @date 2019/10/14 0014 下午 5:13
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationConfig.xml")
public class Spring {
    //spring 测试框架，会把当前类添加到spring容器中，为测试类提供spring上下文
}
