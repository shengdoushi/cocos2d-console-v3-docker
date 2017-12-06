# cocos2dx-console-v3

# 概述

v3 版本的 cocos2d-console. 用于 luacompile, 方便在集成测试中使用

# 使用

首先build
```
	docker build cocos2dx-console-v3 .
```

使用， 平常的  cocos luacompile [args]， 调用为 docker run --rm cocos2dx-console-v3 luacompile [args].

```
	// 功能: [cocos] luacompile -s /project/src -d /project/out --disable-compile
	docker run --rm -v /project:/project cocos2dx-console-v3 -s /project/src -d /project/out --disable-compile
```
