import ABUIComponents
import AlfaFoundation

final class DisplaysShareholderListLogicMock: DisplaysShareholderListLogic {

    // MARK: - displayData

    private(set) var displayDataViewModelWasCalled: Int = 0
    private(set) var displayDataViewModelReceivedViewModel: ShareholderListDataFlow.ViewModel?

    func displayData(viewModel: ShareholderListDataFlow.ViewModel) {
        displayDataViewModelWasCalled += 1
        displayDataViewModelReceivedViewModel = viewModel
    }

    // MARK: - displayError

    private(set) var displayErrorWasCalled: Int = 0
    private(set) var displayErrorReceivedViewModel: DefaultEmptyViewModel?

    func displayError(_ viewModel: DefaultEmptyViewModel) {
        displayErrorWasCalled += 1
        displayErrorReceivedViewModel = viewModel
    }
}

final class DisplaysShareholderListViewMock: UIViewMock, DisplaysContentStateTrait,  DisplaysShareholderListView {
    
    // MARK: - tableView

    private(set) var getTableViewWasCalled: Int = 0
    private(set) var setTableViewWasCalled: Int = 0
    var tableViewStub: UITableView!

    var tableView: UITableView {
        get {
            getTableViewWasCalled += 1
            return tableViewStub
        }
        set {
            setTableViewWasCalled += 1
            tableViewStub = newValue
        }
    }
}

final class ManagingShareholderListTableMock: UITableViewDataSourceMock, ManagingShareholderListTable {
    
    // MARK: - viewModel

    private(set) var getViewModelWasCalled: Int = 0
    private(set) var setViewModelWasCalled: Int = 0
    var viewModelStub: ShareholderListDataFlow.ViewModel?

    var viewModel: ShareholderListDataFlow.ViewModel? {
        get {
            getViewModelWasCalled += 1
            return viewModelStub
        }
        set {
            setViewModelWasCalled += 1
            viewModelStub = newValue
        }
    }
}

final class ProvidesShareholderListMock: ProvidesShareholderList {

    // MARK: - fetchShareholders

    private(set) var fetchShareholdersWasCalled: Int = 0
    var fetchShareholdersStub: Promise<[Shareholder]>!

    func fetchShareholders() -> Promise<[Shareholder]> {
        fetchShareholdersWasCalled += 1
        return fetchShareholdersStub
    }
}

final class ShareholderListBusinessLogicMock: ShareholderListBusinessLogic {

    // MARK: - fetchData

    private(set) var fetchDataWasCalled: Int = 0

    func fetchData() {
        fetchDataWasCalled += 1
    }
}

final class ShareholderListPresentationLogicMock: ShareholderListPresentationLogic {

    // MARK: - presentData

    private(set) var presentDataResponseWasCalled: Int = 0
    private(set) var presentDataResponseReceivedResponse: ShareholderListDataFlow.Response?

    func presentData(response: ShareholderListDataFlow.Response) {
        presentDataResponseWasCalled += 1
        presentDataResponseReceivedResponse = response
    }

    // MARK: - presentError

    private(set) var presentErrorWasCalled: Int = 0
    private(set) var presentErrorReceivedType: ShareholderListDataFlow.ErrorType?

    func presentError(_ type: ShareholderListDataFlow.ErrorType) {
        presentErrorWasCalled += 1
        presentErrorReceivedType = type
    }
}
