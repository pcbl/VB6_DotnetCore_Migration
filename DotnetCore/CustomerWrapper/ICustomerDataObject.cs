using System.Runtime.InteropServices;

namespace CustomerWrapper
{
    [Guid(CustomerDataObject.InterfaceId)]
    [InterfaceType(ComInterfaceType.InterfaceIsIDispatch)]
    public interface ICustomerDataObject
    {
        [DispId(1)]
        string List();
    }
}