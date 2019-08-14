using FluentAssertions;
using LibOne;
using System;
using Xunit;

namespace XUnitTests_LibOne
{
    public class UnitTestForClass1
    {
        string GuidS => Guid.NewGuid().ToString("N");
        [Fact]
        public void test_property_getters()
        {
            var class1 = new Class1();
            string.IsNullOrWhiteSpace(class1.Name).Should().BeTrue();
            var name = GuidS;
            class1.Name = name;
            string.IsNullOrWhiteSpace(class1.Name).Should().BeFalse();

            class1.Name.Should().BeSameAs(name);

        }
    }
}
