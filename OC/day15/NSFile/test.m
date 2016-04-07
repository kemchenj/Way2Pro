-(id)initWithDelegate:(id)m_delegate Selector1:(SEL)testA Selector2:(SEL)testB isA:(BOOL)isTrue
{
    forTestA = testA;//在H文件中定义过SEL类型的forTestA了。
    forTestB = testB;//同上
    if(isTrue) [m_delegate forTestA];
    else [m_delegate forTestB];
}

-(void) testA
{
    NSLog(@”I’m TestA”);
}
-(void) testB
{
    NSLog(@”I’m TestB”);
}

-(void) forTest
{
    B *b = [B initWithDelegate:self Selector1: @selector(testA:) Selector2:@selector(testB:) isA:YES];
}
