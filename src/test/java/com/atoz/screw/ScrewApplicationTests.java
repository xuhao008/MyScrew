package com.atoz.screw;

import cn.smallbun.screw.core.Configuration;
import cn.smallbun.screw.core.engine.EngineConfig;
import cn.smallbun.screw.core.engine.EngineFileType;
import cn.smallbun.screw.core.engine.EngineTemplateType;
import cn.smallbun.screw.core.execute.DocumentationExecute;
import cn.smallbun.screw.core.process.ProcessConfig;
import io.github.yedaxia.apidocs.Docs;
import io.github.yedaxia.apidocs.DocsConfig;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.context.ApplicationContext;

import javax.sql.DataSource;
import java.util.ArrayList;

@SpringBootTest
class ScrewApplicationTests {

    @Autowired
    ApplicationContext applicationContext;

    /**
     * @return void
     * @Description 生成数据库文档，screw 有 HTML、DOC、MD 三种格式的文档。
     * @Param []
     * @Date 2020/8/13 11:00
     **/
    @Test
    void contextLoads() {
        DataSource dataSourceMysql = applicationContext.getBean(DataSource.class);
        // 生成文件配置
        EngineConfig engineConfig = EngineConfig.builder()
                // 生成文件路径，自己mac本地的地址，这里需要自己更换下路径
                //.fileOutputDir("D:/")
                // 打开目录
                .openOutputDir(false)
                // 文件类型，screw 有 HTML、WORD、MD 三种格式的文档。
                //.fileType(EngineFileType.HTML)
                .fileType(EngineFileType.MD)
                // 生成模板实现
                .produceType(EngineTemplateType.freemarker).build();
                // 生成文档配置（包含以下自定义版本号、描述等配置连接）
                Configuration config = Configuration.builder()
                .version("1.0.2")
                .description("生成文档信息描述")
                .dataSource(dataSourceMysql)
                .engineConfig(engineConfig)
                .produceConfig(getProcessConfig())
                .build();
        // 执行生成
        new DocumentationExecute(config).execute();
    }

    /**
     * 配置想要生成的表+ 配置想要忽略的表
     *
     * @return 生成表配置
     */
    public static ProcessConfig getProcessConfig() {
        // 忽略表名
       // List<String> ignoreTableName = Arrays.asList("aasasa", "test_gsasaroup");
        // 忽略表前缀，如忽略a开头的数据库表
       // List<String> ignorePrefix = Arrays.asList("ssasas", "tsasa");
        // 忽略表后缀
       // List<String> ignoreSuffix = Arrays.asList("_tesasat", "czsasb_");
        return ProcessConfig.builder()
                //根据名称指定表生成
                //.designatedTableName(Arrays.asList("fire_user"))
                //根据表前缀生成
                .designatedTablePrefix(new ArrayList<>())
                //根据表后缀生成
                .designatedTableSuffix(new ArrayList<>()).build();
                //忽略表名
                //.ignoreTableName(ignoreTableName)
                //忽略表前缀
               // .ignoreTablePrefix(ignorePrefix)
                //忽略表后缀
                //.ignoreTableSuffix(ignoreSuffix).build();
    }

    /**
     * @Description  JApiDocs生成接口文档
     * @Param []
     * @return void
     * @Date 2020/8/13 15:00
     **/
    @Test
    void Api(){
        DocsConfig config = new DocsConfig();
        config.setProjectPath("E:\\个人文件\\project\\screw\\src\\main\\java\\com\\atoz\\screw"); // 项目根目录
        config.setProjectName("screw"); // 项目名称
        config.setApiVersion("V1.0");       // 声明该API的版本
        config.setDocsPath("E:\\个人文件\\project\\screw\\doc"); // 生成API 文档所在目录
        config.setAutoGenerate(Boolean.TRUE);  // 配置自动生成
        Docs.buildHtmlDocs(config); // 执行生成文档
    }

}

